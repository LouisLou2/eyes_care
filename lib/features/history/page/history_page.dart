import 'package:eyescare/style/app_style.dart';
import 'package:flutter/material.dart';

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
                  'SUN FEB 23',
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage('assets/image/f1.png'),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(color: Colors.grey[700]!, width: 1),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '#142467FF',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '2023-02-23 14:30:45',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage('assets/image/f1.png'),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(color: Colors.grey[700]!, width: 1),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '#142467FF',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '2023-02-23 14:30:45',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage('assets/image/f1.png'),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(color: Colors.grey[700]!, width: 1),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '#142467FF',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '2023-02-23 14:30:45',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage('assets/image/f1.png'),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(color: Colors.grey[700]!, width: 1),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '#142467FF',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '2023-02-23 14:30:45',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage('assets/image/f1.png'),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(color: Colors.grey[700]!, width: 1),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '#142467FF',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '2023-02-23 14:30:45',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ]
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage('assets/image/f1.png'),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(color: Colors.grey[700]!, width: 1),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '#142467FF',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '2023-02-23 14:30:45',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage('assets/image/f1.png'),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(color: Colors.grey[700]!, width: 1),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '#142467FF',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '2023-02-23 14:30:45',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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