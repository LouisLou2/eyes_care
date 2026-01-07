import 'package:eyescare/const/serverity_level.dart';
import 'package:eyescare/style/app_style.dart';
import 'package:flutter/material.dart';

class PercentCard extends StatelessWidget {
  final String title;
  final double percent;
  final SeverityLevel level;
  final Color? color;

  const PercentCard({
    super.key,
    required this.title,
    required this.percent,
    required this.level,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // 圆角
      elevation: 4, // 阴影效果
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14), // 卡片内边距
        child: Column(
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
                    fontSize: 28,
                    fontFamily: AppStyle.fontFamily2,
                  ),
                ),
              ],
            ),
            Text(
              "严重等级: ${level.name}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 8), // 间距
            LinearProgressIndicator(
              value: percent,
              minHeight: 8,
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
              valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
            ),
          ],
        ),
      ),
    );
  }
}