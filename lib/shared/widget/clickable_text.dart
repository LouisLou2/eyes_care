import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double size;
  final Color? color;
  final double decorationThickness;

  ClickableText({
    super.key,
    required this.text,
    this.onPressed,
    this.size = 16,
    this.decorationThickness = 1,
    this.color,
  });

  bool isHovering = false;


  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHovering = true),
          onExit: (_) => setState(() => isHovering = false),
          child: GestureDetector(
            onTap: onPressed,
            child: Text(
              text,
              style: TextStyle(
                color: color ?? Colors.black,
                decorationStyle: TextDecorationStyle.solid,
                decorationThickness: decorationThickness,
                decorationColor: color ?? Colors.black,
                fontSize: size,
                fontWeight: FontWeight.normal,
                decoration: isHovering
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
            ),
          ),
        );
      },
    );
  }
}