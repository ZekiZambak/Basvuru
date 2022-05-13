//ZEKİ ZAMBAK - zeki_zambak@hotmail.com - 5362709845

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/helper/binding.dart';
import 'package:interview/view/control_view.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: Binding(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: ControlView(),
        )
    );
  }
}
