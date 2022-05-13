import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/view_model/auth_view_model.dart';
import 'package:interview/widgets/custom_button.dart';
import 'package:interview/widgets/custom_text.dart';
import 'package:interview/widgets/custom_text_form_field.dart';


class RegisterScreen extends GetWidget<AuthViewModel> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        backgroundColor: Colors.redAccent.shade100,
      ),
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
                padding: const EdgeInsets.only(top: 100, right: 40, left: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomText(text: "Sign Up", fontSize: 20),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        hintText: "Name",
                        isObscure: false,
                        onSaved: (value) {
                          controller.name = value!;
                        },
                        validator: (value) {
                          return value!.isNotEmpty
                              ? null
                              : "Boş Bırakılamaz";
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        hintText: "Email",
                        isObscure: false,
                        onSaved: (value) {
                          controller.email = value!;
                        },
                        validator: (value) {
                          return value!.isNotEmpty
                              ? null
                              : "Boş Bırakılamaz";
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
                          return value!.isNotEmpty
                              ? null
                              : "Boş Bırakılamaz";
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: CustomButton(
                          text: "Sign up",
                          onPressed: () {
                            _formKey.currentState!.save();
                            if(_formKey.currentState!.validate()){
                              controller.createAccountWithEmailandPassword();
                            }
                          },
                        ),
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
