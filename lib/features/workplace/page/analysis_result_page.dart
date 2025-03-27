import 'package:eyescare/const/serverity_level.dart';
import 'package:eyescare/features/workplace/entity/rencent_record.dart';
import 'package:eyescare/features/workplace/shered/analysis_card.dart';
import 'package:eyescare/features/workplace/shered/model_processing_widget.dart';
import 'package:eyescare/features/workplace/shered/percent_card.dart';
import 'package:eyescare/features/workplace/shered/percent_info_widget.dart';
import 'package:eyescare/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'dart:html' as html;

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

  final List<String> formats = ['PDF', 'Docx'];

  void downloadAssetFile() {
    String origin = html.window.location.origin;
    // 获取资源的完整路径（根据您的应用部署方式可能需要调整）
    String url = '$origin/assets/assets/reports/analysis.pdf';

    // 创建一个隐藏的 <a> 元素
    final anchor = html.AnchorElement(href: url)
      ..target = 'blank'
      ..download = 'AnalysisResult.pdf';

    // 将链接添加到文档中并触发点击
    html.document.body?.append(anchor);
    anchor.click();

    // 从文档中移除链接
    anchor.remove();
  }

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
                        // ElevatedButton(
                        //   style: ElevatedButton.styleFrom(
                        //     padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                        //     backgroundColor: Colors.deepOrange,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //   ),
                        //   onPressed: () {},
                        //   child: Text(
                        //     "Export",
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 13,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // ),
                        ShadSelect<String>(
                            decoration: ShadDecoration(
                              border: ShadBorder.all(color: Colors.deepOrange, width: 2),
                            ),
                            placeholder: const Text('Export'),
                            options: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'File Formats',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ...formats.map((e) => ShadOption(value: e, child: Text(e))),
                            ],
                            selectedOptionBuilder: (context, value) => Text(value),
                            onChanged: (v){
                              downloadAssetFile();
                            }
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
                                                "assets/image/f1_part1.png",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(16),
                                              child: Image.asset(
                                                "assets/image/f1_part2.png",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(16),
                                              child: Image.asset(
                                                "assets/image/f1_part3.png",
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
                                    percent: 0.704,
                                    level: SeverityLevel.Critical,
                                    color: Colors.white12,
                                  ),
                                  PercentCard(
                                    title: "Cataract",
                                    percent: 0.551,
                                    level: SeverityLevel.General,
                                    color: Colors.white12,
                                  ),
                                ],
                              ),
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
                                        title: "Age-related Macular Degeneration (AMD)",
                                        percent: 0.497,
                                        level: SeverityLevel.General,
                                        color: Colors.transparent,
                                      ),
                                      PercentInfoWidget(
                                        title: "Myopia",
                                        percent: 0.406,
                                        level: SeverityLevel.Critical,
                                      ),
                                      PercentInfoWidget(
                                        title: "Normal",
                                        percent: 0.360,
                                        level: SeverityLevel.General,
                                      ),
                                      PercentInfoWidget(
                                        title: "Hypertensive Retinopathy",
                                        percent: 0.205,
                                        level: SeverityLevel.Critical,
                                      ),
                                      PercentInfoWidget(
                                        title: "Other diseases/abnormalities",
                                        percent: 0.100,
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
                          description: "The AI model has detected significant indications of diabetic retinopathy in this 45-year-old male patient. Multiple microaneurysms appear as small, round, red dots scattered across the retinal surface, particularly concentrated in the temporal region. Dot and blot hemorrhages are visible in all four quadrants of the retina, indicating widespread vascular damage. The presence of cotton wool spots (soft exudates) suggests areas of retinal ischemia, while hard exudates (yellowish deposits) are arranged in a circinate pattern around leaking microaneurysms, particularly threatening the macular region\nNeovascularization is evident at the optic disc (NVD) and elsewhere (NVE), indicating progression to proliferative diabetic retinopathy (PDR), which represents an advanced stage requiring urgent intervention. The AI also identified venous beading and intraretinal microvascular abnormalities (IRMA), classic markers of severe non-proliferative diabetic retinopathy. The macular region shows signs of edema, with increased retinal thickness that could explain potential vision complaints. For a male patient at age 45, this pattern suggests uncontrolled or long-standing diabetes mellitus, possibly undiagnosed or poorly managed for several years. The algorithm has specifically identified these features through differential analysis of vascular patterns and pathological structures against normative databases of thousands of fundus images.",
                        ),
                        AnalysisCard(
                            title: "Glaucoma",
                            percent: 0.704,
                            description: 'The fundus image analysis reveals significant glaucomatous changes in this 45-year-old male. The optic nerve head shows pronounced cupping with a cup-to-disc ratio of approximately 0.7-0.8, significantly higher than the normal 0.3-0.4 range. There is characteristic thinning of the neuroretinal rim, particularly evident in the inferior and superior quadrants (following the ISNT rule violation pattern). The model detected bayoneting of vessels at the disc margin, where blood vessels make a sharp angle as they cross the excavated disc edge.\nPeripapillary atrophy is present, forming a beta-zone around the optic disc, which strongly correlates with glaucomatous damage. The neural retinal fiber layer (RNFL) shows areas of defects, visible as dark, wedge-shaped regions extending from the optic disc. For a 45-year-old male, these changes are premature and concerning, as they typically develop later in life. The AI algorithm measured the rim-to-disc parameters and compared vascular patterns and nerve fiber layer integrity against age-matched controls, identifying specific glaucomatous patterns. The degree of neural damage suggests moderate to advanced glaucoma that has likely been developing for years, possibly without symptoms until recently. This pattern indicates a need for immediate pressure management and possibly surgical intervention to prevent further vision loss.'
                        ),
                        AnalysisCard(
                          title: "Cataract",
                          percent: 0.551,
                          description: "Despite fundus imaging primarily focusing on the retina, the AI model has detected several indirect signs of cataract formation in this 45-year-old male patient. The overall image quality shows a characteristic reduction in contrast and clarity that extends beyond what would be expected from technical imaging factors. The red reflex appears diminished, and there is a subtle yellow-brownish tint overlying the entire fundus view, indicating nuclear sclerosis of the lens.\nThe model identified areas of \"watermark\" effects and shadow artifacts consistent with early posterior subcapsular cataract formation. Light scatter patterns suggest cortical spoke-like opacities, particularly in the equatorial region of the lens. At age 45, these changes are occurring earlier than the typical age-related progression, suggesting possible risk factors such as uncontrolled diabetes, extended corticosteroid use, or significant UV exposure. The AI system has been trained to recognize these subtle media opacities by analyzing the quality degradation patterns across thousands of images with confirmed cataract diagnoses. The 55.1% probability indicates moderate confidence in early to moderate cataract changes that may already be affecting visual quality, particularly in low-contrast or glare-prone environments, and may warrant further slit-lamp examination to confirm lens opacity classification and severity.",
                        ),
                        AnalysisCard(
                          title: "Age-related Macular Degeneration (AMD)",
                          percent: 0.497,
                          description: "The AI model has identified several key features of early Age-related Macular Degeneration in this 45-year-old male patient, which is notably younger than the typical AMD demographic. Multiple small to intermediate-sized drusen (50-125 μm in diameter) are scattered throughout the macular region, appearing as yellowish deposits beneath the retinal pigment epithelium (RPE). The model detected subtle pigmentary abnormalities, including both hyperpigmentation and RPE atrophy in a parafoveal distribution pattern.\nThe drusen have a soft appearance with indistinct borders, rather than the hard, punctate drusen sometimes seen in normal aging. Geographic atrophy is not yet extensive, but early signs of RPE degeneration are visible in the temporal macula. The foveal reflex appears altered, suggesting potential photoreceptor disruption. While this presentation is unusual for a 45-year-old, the pattern suggests early-onset AMD, possibly associated with genetic predisposition (such as CFH or ARMS2 gene variants) or environmental risk factors like smoking. The AI system has quantified drusen area, distribution patterns, and pigmentary changes, comparing them against patterns seen in confirmed AMD cases across different stages. The 49.7% probability reflects the algorithm's moderate confidence in these being true AMD changes rather than other maculopathies, and suggests careful monitoring with OCT imaging and lifestyle modifications to slow progression from dry to wet AMD.",
                        ),
                        AnalysisCard(
                          title: "Myopia",
                          percent: 0.406,
                          description: "The fundus examination of this 45-year-old male reveals characteristic features of pathologic myopia. The optic disc shows significant enlargement with an oblique insertion and a prominent myopic crescent (peripapillary atrophy) extending temporally from the disc margin. This crescent appears as a whitish, atrophic region where the choroid and retinal pigment epithelium have thinned significantly, exposing the underlying sclera. The retinal vessels demonstrate a straightened pattern with decreased branching angles and a \"stretched\" appearance as they course from the disc toward the periphery.\nThe macula shows evidence of retinal thinning with increased visibility of the choroidal vessels, creating a \"tigroid\" or \"tessellated\" fundus appearance. There are subtle signs of lacquer cracks (breaks in Bruch's membrane) appearing as yellowish, linear lesions in the posterior pole. The peripheral retina exhibits areas of lattice degeneration, which appears as whitish, thinned areas with pigmentary changes. At age 45, these findings represent long-standing axial myopia rather than recent development. The AI model has analyzed the optic disc morphology, vessel architecture, and retinal pigment epithelial changes against normative databases of myopic eyes. The 40.6% probability suggests moderate myopic changes that may carry risk for future complications such as retinal detachment, myopic macular degeneration, or choroidal neovascularization, warranting regular monitoring of the peripheral retina and macula.",
                        ),
                        AnalysisCard(
                          title: "Normal",
                          percent: 0.360,
                          description: "Despite the higher probabilities of pathological conditions, the AI model identifies several aspects of this 45-year-old male's fundus that maintain normal characteristics. The macular region partially preserves a normal foveal light reflex and contour, without the severe disruptions seen in advanced pathology. Some areas of the retina, particularly in the superior nasal quadrant, display regular vascular branching patterns and healthy-appearing retinal tissue. The peripheral retina shows expected tapering of vessels without abnormal tortuosity in certain segments.\nThe background retina maintains relatively uniform coloration in select areas, without the widespread disturbances seen in advanced disease states. The optic disc, while showing some suspicious features, retains partial preservation of the neuroretinal rim in the nasal sector. The model has compared these preserved normal features against both pathological patterns and normative data from healthy 45-year-old males. The relatively low probability of 36.0% indicates that while some normal characteristics are preserved, the overall fundus appearance deviates significantly from expected healthy patterns for this age group. This suggests that while some areas appear unaffected, the eye shows substantial pathological changes overall, reinforcing the higher probabilities assigned to specific disease entities and underscoring the importance of comprehensive treatment and monitoring.",
                        ),
                        AnalysisCard(
                          title: "Hypertensive Retinopathy",
                          percent: 0.215,
                          description: "The AI model has identified subtle but characteristic signs of hypertensive retinopathy in this 45-year-old male patient. Arteriolar narrowing is evident, with a decreased arteriole-to-venule ratio (AVR) of approximately 1:2 rather than the normal 2:3 or 1:1.5, suggesting chronic hypertensive stress on the retinal vasculature. Arteriovenous crossing changes (AV nicking) are visible at several intersection points, where the arteriole compresses the underlying venule, creating a characteristic \"pinching\" appearance indicative of Grade 2 hypertensive retinopathy.\nThe model detected increased light reflex from arteriolar walls (copper wiring) in several vessels, indicating arteriolosclerosis and hypertension-induced vascular wall thickening. There are early signs of vascular tortuosity, particularly in second and third-order arterioles. While flame-shaped hemorrhages and cotton wool spots (typically seen in more advanced hypertensive retinopathy) are absent, the vascular architecture changes suggest ongoing hypertensive effects. For a 45-year-old male, these findings suggest early to moderate hypertensive changes, possibly indicating undiagnosed or sub-optimally controlled hypertension. The AI system analyzed vascular caliber, branching patterns, and AV crossing phenomena against normative databases and hypertensive classification standards. The 21.5% probability reflects the model's assessment that these changes are mild to moderate but definitively present, warranting blood pressure evaluation and potential cardiovascular risk assessment, especially given the patient's age and gender, which place him in a higher risk category for hypertension-related complications.",
                        ),
                        AnalysisCard(
                          title: "Other diseases/abnormalities",
                          percent: 0.100,
                          description: "The AI model has detected several subtle anomalies that don't fit perfectly into the other diagnostic categories. A small area of hypopigmentation near the superior temporal arcade could represent an old chorioretinal scar, possibly from resolved inflammation or previous infection. There is mild epiretinal membrane formation causing subtle wrinkling of the inner retinal surface, particularly in the parafoveal region, which can occur idiopathically or secondary to other retinal conditions.\nThe model identified slight irregularities in the vascular caliber transitions that don't follow the classical patterns of hypertensive or diabetic vasculopathy. A small, round, yellowish lesion in the far periphery might represent a peripheral drusen or small choroidal nevus requiring further characterization. There appears to be subtle pigment mottling in the inferior retina that doesn't conform to typical AMD patterns, potentially representing early manifestations of a pattern dystrophy or central serous retinopathy. At age 45, these findings could represent early manifestations of less common retinal conditions or normal anatomical variants. The AI system flagged these anomalies as not fitting confidently within its primary diagnostic categories, accounting for the low 10.0% probability. These findings may warrant additional imaging studies such as OCT, autofluorescence, or angiography for definitive characterization, though they likely represent incidental findings rather than vision-threatening pathology at this stage.",
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