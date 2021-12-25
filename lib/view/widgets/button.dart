import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onClick;
  final String text;
  final Color? color;
  final Color? textColor;
  final double? shadow;
  final double? circular;

  final double? textSize;

  final FontWeight? fontWeight;

  CustomButton(
      {required this.onClick,
      required this.text,
      this.color,
      this.textSize,
      this.textColor,
      this.shadow,
      this.circular,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 45,
        child: MaterialButton(
          onPressed: () {
            onClick;
          },
          color: color,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: fontWeight),
            ),
          )),
          elevation: shadow,
          textColor: textColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(circular!)),
        ),
      ),
    );
  }
}
