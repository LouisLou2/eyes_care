import 'package:eyescare/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AnalysisDetail extends StatelessWidget {
  final String title;
  final double percent;
  final String description;

  const AnalysisDetail({super.key, required this.title, required this.percent, required this.description,});

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      scrollable: true,
      constraints: BoxConstraints(
        maxWidth: 800,
      ),
      actions: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Colors.deepOrangeAccent,
            ),
          ),
          child: Text(
            'Close',
            style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 14,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
      titleStyle: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontFamily: AppStyle.fontFamily1,
      ),
      title: const Text(
        'Analysis Report',
      ),
      description: const Text(
        "Model can make many mistakes, this report is just for reference.",
      ),
      gap : 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.deepOrange.shade500,
                  fontSize: 24,
                ),
              ),
              Spacer(),
              Text(
                '${(percent * 100).toStringAsFixed(2)}%',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: AppStyle.fontFamily2,
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}