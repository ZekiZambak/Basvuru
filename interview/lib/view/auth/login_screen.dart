import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/view/auth/register_screen.dart';
import 'package:interview/view_model/auth_view_model.dart';
import 'package:interview/widgets/custom_button.dart';
import 'package:interview/widgets/custom_button_image.dart';
import 'package:interview/widgets/custom_text.dart';
import 'package:interview/widgets/custom_text_form_field.dart';

class LoginScreen extends GetWidget<AuthViewModel> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.redAccent.shade100,
                      Colors.deepPurple.shade700,
                    ]),
              ),
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.only(top: 140, right: 40, left: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomText(text: "Login to Your Account", fontSize: 20),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        hintText: "Email",
                        isObscure: false,
                        onSaved: (value) {
                          controller.email = value!;
                        },
                        validator: (value) {
                          if(value == null){
                            print("Error");
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        hintText: "Password",
                        isObscure: true,
                        onSaved: (value) {
                          controller.password = value!;
                        },
                        validator: (value) {
                          if(value == null){
                            print("Error");
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: CustomButton(
                          text: "Sign in",
                          onPressed: () {
                            _formKey.currentState!.save();
                            if(_formKey.currentState!.validate()){
                              controller.signInWithEmailandPassword();
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomText(
                        alignment: Alignment.center,
                        text: "-Or Sign in with-",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButtonImage(
                        imageName: "images/google.png",
                        height: 40,
                        width: 70,
                        color: Colors.white,
                        onTap: (){
                          controller.googleSignIn();
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Don't have an account?",
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.to(RegisterScreen());
                            },
                            child: CustomText(
                              text: "Sign up",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
