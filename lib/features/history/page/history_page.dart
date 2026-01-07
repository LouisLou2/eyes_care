import 'package:eyescare/features/control_page/page/control_framework.dart';
import 'package:eyescare/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Sun Feb 23
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MON APR 14',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppStyle.fontFamily2,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    getHistoryCard(context, '#152465FF', '2025-02-23 11:30:45', 'assets/eyes/e1_o.jpg'),
                    getHistoryCard(context, '#142233FF', '2025-02-23 08:30:04', 'assets/eyes/e2_o.jpg'),
                    getHistoryCard(context, '#108937FF', '2025-02-23 23:29:10', 'assets/eyes/e3_o.jpg'),
                  ]
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FRI FEB 21',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppStyle.fontFamily2,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    getHistoryCard(context, '#112261FF', '2023-02-21 10:30:01', 'assets/eyes/e4_o.jpg'),
                    getHistoryCard(context, '#123261FF', '2023-02-21 12:30:04', 'assets/eyes/e5_o.jpg'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TUR FEB 20',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppStyle.fontFamily2,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    getHistoryCard(context, '#897865RR', '2023-02-20 14:45:45', 'assets/eyes/e6_o.jpg'),
                    getHistoryCard(context, '#144467FF', '2023-02-20 19:35:45', 'assets/eyes/e7_o.jpg'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}


Widget getHistoryCard(BuildContext context,String id, String time, String imageUrl){
  return GestureDetector(
    onTap: (){
      context.read<StudioProv>().setAnalysisState(AnalysisState.done);
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: Colors.grey[700]!, width: 1),
          ),
        ),
        SizedBox(height: 5),
        Text(
          id,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          time,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}