import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:interview/model/user_model.dart';
import 'package:interview/service/firestore_user.dart';
import 'package:interview/view/control_view.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String email, password, name;

  final Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleSignIn() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user){
      saveUser(user);
    });
    Get.offAll(ControlView());
  }

  void signInWithEmailandPassword() async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(ControlView());
    }on FirebaseAuthException catch (e) {
      print(e.message);
      Get.snackbar("Error Sign in Account", e.message.toString(), colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailandPassword() async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((user) async {
        saveUser(user);
      });
      Get.offAll(ControlView());
    }on FirebaseAuthException catch (e) {
      print(e.message);
      Get.snackbar("Error Sign up Account", e.message.toString(), colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      name: name == null ? user.user!.displayName : name,
      pic: '',
    );
    await FirestoreUser().addUserToFirestore(userModel);
  }

}
