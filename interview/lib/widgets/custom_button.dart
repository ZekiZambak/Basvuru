import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final VoidCallback? onPressed;
  final Color color;

  CustomButton({this.text = '', this.onPressed, this.color = Colors.white60});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: CustomText(
        text: text,
        fontSize: 24,
        alignment: Alignment.center,
        color: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        primary: color,
      ),
    );
  }
}
