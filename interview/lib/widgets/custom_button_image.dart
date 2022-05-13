import 'package:flutter/material.dart';

class CustomButtonImage extends StatelessWidget {

  final GestureTapCallback? onTap;
  final String? imageName;
  final double? height;
  final double? width;
  final Color? color;

  CustomButtonImage({this.onTap, this.imageName, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: color,
        elevation: 8,
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          splashColor: Colors.black26,
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Ink.image(
                image: AssetImage(imageName!),
                height: height,
                width: width,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
