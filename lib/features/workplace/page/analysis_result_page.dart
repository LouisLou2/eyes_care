import 'package:eyescare/const/serverity_level.dart';
import 'package:eyescare/features/workplace/entity/rencent_record.dart';
import 'package:eyescare/features/workplace/shered/analysis_card.dart';
import 'package:eyescare/features/workplace/shered/model_processing_widget.dart';
import 'package:eyescare/features/workplace/shered/percent_card.dart';
import 'package:eyescare/features/workplace/shered/percent_info_widget.dart';
import 'package:eyescare/style/app_style.dart';
import 'package:flutter/material.dart';

class AnalysisResultPage extends StatefulWidget {

  final bool hasResult;
  const AnalysisResultPage({super.key, required this.hasResult});

  @override
  State<AnalysisResultPage> createState() => _AnalysisResultPageState(hasResult);
}

class _AnalysisResultPageState extends State<AnalysisResultPage> {

  final ValueNotifier<bool> _hasResult;

  final String desc = 'Diagnosed with wet AMD in right eye (11/08/2024) and mild bilateral cataracts. Visual acuity: OD 20/100 (corrected 20/70), OS 20/40 (corrected 20/25). IOP: 18/16 mmHg. Currently receiving Lucentis injections q4weeks in right eye, using Timolol drops BID in both eyes, and short-term Prednisolone in right eye. Latest OCT (03/12/2025) shows decreased subretinal fluid and reduced macular leakage. Treatment plan includes continued anti-VEGF therapy, monitoring via OCT, and potential cataract surgery after AMD stabilization. Next appointment: 04/09/2025 with Dr. Williams for injection and follow-up.';

  _AnalysisResultPageState(bool hasResult): _hasResult = ValueNotifier<bool>(hasResult);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 4),
        Flexible(
          flex: 2,
          child: Column(
            children: [
              SizedBox(height: 4), // 间距
              Card(
                color: Colors.white12,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // 圆角
                elevation: 4, // 阴影效果
                child: Padding(
                  padding: EdgeInsets.all(16), // 卡片内边距
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // 使卡片大小自适应内容
                    children: [
                      // 顶部：徽章和标题
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white12,
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              "assets/image/f1.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Preliminary diagnosis",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16), // 间距
                      // X 射线图像和控制面板
                      Stack(
                        children: [
                          // 假设有一个 X 射线图像资源
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              "assets/image/f1.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 10,
                            top: 10,
                            child: Column(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.swap_horiz, color: Colors.white),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(Icons.rotate_right, color: Colors.white),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(Icons.straighten, color: Colors.white),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 12,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                backgroundColor: Colors.deepOrangeAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Analyze Again",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            bottom: 12,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.add_circle_outline, color: Colors.white),
                                  Text(
                                    "Add scan",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 4), // 间距
              Expanded(
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // 圆角
                  child: Padding(
                    padding: EdgeInsets.all(14), // 卡片内边距
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min, // 使卡片大小自适应内容
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 2,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.asset(
                                "assets/image/doctor1-min.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 16),
                            Wrap(
                              direction: Axis.vertical,
                              children: [
                                Text(
                                  "Patient Information",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Patient ID: OPH-2025-8743",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 8), // 间距
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              children: [
                                Text(
                                  'Gender: ',
                                  style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Male',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 40),
                            Wrap(
                              children: [
                                Text(
                                  'Age: ',
                                  style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '45',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 4), // 间距
                        Flexible(  // 或 Expanded
                          child: Text(
                            desc,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              wordSpacing: 1.5,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Flexible(
          flex: 3,
          child: ValueListenableBuilder<bool>(
            valueListenable: _hasResult,
            builder: (context, hasRes, _){
              return !_hasResult.value ? AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: AILoadingScreen(
                  onLoadingComplete: () => _hasResult.value = true,
                ),
              ) : AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    toolbarHeight: 46,
                    actionsPadding: EdgeInsets.only(right: 12),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    title: Text(
                      "Analysis Results",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                          backgroundColor: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Export",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  body: ListView(
                    children: [
                      Card(
                        color: Colors.white12,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // 圆角
                        elevation: 4, // 阴影效果
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10), // 卡片内边距
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min, // 使卡片大小自适应内容
                            children: [
                              Text(
                                "Key Area Labeling",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8), // 间距
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    flex: 22,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.asset(
                                        "assets/image/f1.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Flexible(
                                      flex: 7,
                                      child: Column(
                                        spacing: 10,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(16),
                                            child: Image.asset(
                                              "assets/image/f1.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(16),
                                            child: Image.asset(
                                              "assets/image/f1.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(16),
                                            child: Image.asset(
                                              "assets/image/f1.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      )
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16), // 间距
                      Text(
                        " Retinal Image Assessment",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10), // 间距
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  PercentCard(
                                    title: "Diabetic Retinopathy",
                                    percent: 0.899,
                                    level: SeverityLevel.General,
                                    color: Colors.white12,
                                  ),
                                  PercentCard(
                                    title: "Glaucoma",
                                    percent: 0.509,
                                    level: SeverityLevel.Critical,
                                    color: Colors.white12,
                                  ),
                                  PercentCard(
                                    title: "Cataract",
                                    percent: 0.20,
                                    level: SeverityLevel.General,
                                    color: Colors.white12,
                                  ),
                                ],
                              )
                          ),
                          Expanded(
                            flex: 4,
                            child: Card(
                              color: Colors.white12,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // 圆角
                              elevation: 4, // 阴影效果
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(25,16,25,14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min, // 使卡片大小自适应内容
                                  spacing: 24,
                                  children: [
                                    PercentInfoWidget(
                                      title: "Diabetic Retinopathy",
                                      percent: 0.899,
                                      level: SeverityLevel.General,
                                      color: Colors.transparent,
                                    ),
                                    PercentInfoWidget(
                                      title: "Glaucoma",
                                      percent: 0.509,
                                      level: SeverityLevel.Critical,
                                    ),
                                    PercentInfoWidget(
                                      title: "Cataract",
                                      percent: 0.20,
                                      level: SeverityLevel.General,
                                    ),
                                    PercentInfoWidget(
                                      title: "Glaucoma",
                                      percent: 0.509,
                                      level: SeverityLevel.Critical,
                                    ),
                                    PercentInfoWidget(
                                      title: "Cataract",
                                      percent: 0.20,
                                      level: SeverityLevel.General,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16), // 间距
                      Text(
                        " Detailed Analysis",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16), // 间距
                      AnalysisCard(
                        title: "Diabetic Retinopathy",
                        percent: 0.899,
                        emphasize: true,
                        description: "Diabetic retinopathy is a diabetes complication that affects eyes. It's caused by damage to the blood vessels of the light-sensitive tissue at the back of the eye (retina).",
                      ),
                      AnalysisCard(
                        title: "Glaucoma",
                        percent: 0.509,
                        description: "Glaucoma is a group of eye conditions that damage the optic nerve, which is vital to good vision. This damage is often caused by an abnormally high pressure in your eye.",
                      ),
                      AnalysisCard(
                        title: "Cataract",
                        percent: 0.20,
                        description: "A cataract is a clouding of the lens in the eye that affects vision. Most cataracts are related to aging. Cataracts are very common in older people.",
                      ),
                    ],
                  ),
                ),
              );
            }
          ),
        ),
      ],
    );
  }
}