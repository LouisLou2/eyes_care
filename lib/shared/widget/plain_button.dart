import 'package:eyescare/style/app_style.dart';
import 'package:flutter/material.dart';

class PlainTextButton extends TextButton {
  PlainTextButton({
    super.key,
    required String text,
    required super.onPressed,
    double? size,
  }) : super(
    style: ButtonStyle(
      overlayColor: WidgetStateProperty.all(
        Colors.white.withOpacity(0.2),
      ),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: size ?? 16,
        fontWeight: FontWeight.normal,
        fontFamily: AppStyle.fontFamily1,
      ),
    ),
  );
}