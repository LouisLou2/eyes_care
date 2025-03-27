import 'package:eyescare/features/workplace/shered/analysis_detail.dart';
import 'package:eyescare/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AnalysisCard extends StatelessWidget {
  final String title;
  final double percent;
  final String description;
  final bool emphasize;

  const AnalysisCard({super.key, required this.title, required this.percent, required this.description, this.emphasize = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: emphasize ? LinearGradient(
          colors: [Colors.deepOrangeAccent.shade700, Colors.deepOrange, Colors.black87, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.4, 0.9, 0.95],
        ): null,
        color: emphasize ? null : Colors.white12,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: emphasize ? Colors.white : Colors.deepOrangeAccent,
                  width: 1.5,
                ),
              ),
              child: Text(
                'View Details',
                style: TextStyle(
                  color: emphasize ? Colors.white : Colors.deepOrangeAccent,
                  fontSize: 14,
                ),
              ),
              onPressed: () {
                showShadDialog(
                  context: context,
                  builder: (context) => AnalysisDetail(
                    title: title,
                    percent: percent,
                    description: description,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}