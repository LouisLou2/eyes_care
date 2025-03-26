import 'package:eyescare/const/serverity_level.dart';
import 'package:eyescare/style/app_style.dart';
import 'package:flutter/material.dart';

class PercentInfoWidget extends StatelessWidget {
  final String title;
  final double percent;
  final SeverityLevel level;
  final Color? color;

  const PercentInfoWidget({
    super.key,
    required this.title,
    required this.percent,
    required this.level,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, // 使卡片大小自适应内容
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${(percent * 100).toStringAsFixed(1)}%",
              style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontSize: 24,
                fontFamily: AppStyle.fontFamily2,
              ),
            ),
          ],
        ),
        LinearProgressIndicator(
          value: percent,
          minHeight: 6,
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.circular(10),
          valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
        ),
      ],
    );
  }
}