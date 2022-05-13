import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  bool? isObscure = true;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final Color? hintColor;
  final InputBorder? border;

  CustomTextFormField(
      {this.hintText,
        this.isObscure,
        this.onSaved,
        this.validator,
        this.hintColor = Colors.white,
      this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        obscureText: isObscure!,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor),
          border: border,
        ),
      ),
    );
  }
}
