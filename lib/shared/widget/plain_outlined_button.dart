import 'package:flutter/material.dart';

class PlainOutlinedButton extends OutlinedButton {
  PlainOutlinedButton({
    super.key,
    required String text,
    required super.onPressed,
    double? size,
    double? padding,
  }) : super(
    style: ButtonStyle(
      overlayColor: WidgetStateProperty.all(Colors.white.withOpacity(0.2)),
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(
          vertical: padding ?? 10,
          horizontal: padding !=null ? padding * 2 : 20,
        ),
      ),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: size ?? 16,
      ),
    ),
  );
}