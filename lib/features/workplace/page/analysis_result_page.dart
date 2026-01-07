import 'package:eyescare/const/serverity_level.dart';
import 'package:eyescare/features/workplace/shered/analysis_card.dart';
import 'package:eyescare/features/workplace/shered/model_processing_widget.dart';
import 'package:eyescare/features/workplace/shered/percent_card.dart';
import 'package:eyescare/features/workplace/shered/percent_info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'dart:html' as html;

class AnalysisResultPage extends StatefulWidget {

  final bool hasResult;
  const AnalysisResultPage({super.key, required this.hasResult});

  @override
  State<AnalysisResultPage> createState() => _AnalysisResultPageState(hasResult);
}

class _AnalysisResultPageState extends State<AnalysisResultPage> with TickerProviderStateMixin {
  final ValueNotifier<bool> originalLeft = ValueNotifier<bool>(true);
  final ValueNotifier<bool> resultLeft = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _hasResult;
  final String desc = '诊断：右眼湿性年龄相关性黄斑变性（2024年11月8日确诊）以及双眼轻度白内障。视力：右眼（矫正前）20/100，（矫正后）20/70，左眼（矫正前）20/40，（矫正后）20/25。眼压：右眼18 mmHg，左眼16 mmHg。目前治疗方案包括右眼每4周一次的Lucentis注射、双眼每日两次使用噻吗洛尔滴眼液，以及短期使用右眼泼尼松龙滴眼液。最近一次OCT检查（2025年3月12日）显示视网膜下积液减少，黄斑渗漏减轻。治疗计划包括继续进行抗VEGF治疗，通过OCT监测病情，以及在黄斑变性病情稳定后可能进行白内障手术。下次预约：2025年4月9日，与Williams医生会面进行注射和随访。';
  _AnalysisResultPageState(bool hasResult): _hasResult = ValueNotifier<bool>(hasResult);
  final List<String> formats = ['PDF', 'Docx'];
  TabController? originalTabController;
  TabController? resultTabController;

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
  void initState() {
    super.initState();
    _hasResult.value = widget.hasResult;
    originalTabController = TabController(length: 2, vsync: this);
    resultTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    originalLeft.dispose();
    resultLeft.dispose();
    _hasResult.dispose();
    originalTabController?.dispose();
    resultTabController?.dispose();
    super.dispose();
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
                      Text(
                        "初步诊断",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2), // 间距
                      ValueListenableBuilder(
                        valueListenable: originalLeft,
                        builder: (context, isLeft, _) => CupertinoSlidingSegmentedControl<bool>(
                          groupValue: isLeft,
                          children: <bool, Widget>{
                            true : Text("  左眼  "),
                            false: Text("  右眼  "),
                          },
                          onValueChanged: (bool? value){
                            originalLeft.value = value!;
                            originalTabController?.animateTo(value ? 0 : 1);
                          },
                        ),
                      ),
                      SizedBox(height: 4), // 间距
                      Stack(
                        children: [
                          // 假设有一个 X 射线图像资源
                          SizedBox(
                            height: 450,
                            child: TabBarView(
                              controller: originalTabController,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    "assets/eyes/e1_o.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    "assets/eyes/e2_o.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
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
                                "重新分析",
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
                                    "添加扫描",
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
                                  "患者信息",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "患者编号: OPH-2025-8743",
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
                                  '性别: ',
                                  style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '男',
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
                                  '年龄: ',
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
          flex: 4,
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
                      automaticallyImplyLeading: false,
                      elevation: 0,
                      toolbarHeight: 46,
                      actionsPadding: EdgeInsets.only(right: 12),
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      title: Text(
                        "分析结果",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      actions: [
                        ShadSelect<String>(
                          decoration: ShadDecoration(
                            border: ShadBorder.all(color: Colors.deepOrange, width: 2),
                          ),
                          placeholder: const Text('导出'),
                          options: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                '文件格式',
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
                                  "影像处理结果",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 2), // 间距
                                ValueListenableBuilder(
                                  valueListenable: resultLeft,
                                  builder: (context, isLeft, _) => CupertinoSlidingSegmentedControl<bool>(
                                    groupValue: isLeft,
                                    children: <bool, Widget>{
                                      true : Text("  左眼  "),
                                      false: Text("  右眼  "),
                                    },
                                    onValueChanged: (bool? value){
                                      resultLeft.value = value!;
                                      resultTabController?.animateTo(value ? 0 : 1);
                                    },
                                  ),
                                ),
                                SizedBox(height: 4), // 间距
                                SizedBox(
                                  height: 380,
                                  child: TabBarView(
                                    controller: resultTabController,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(16),
                                            child: Image.asset(
                                              "assets/eyes/e1_p.jpg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(16),
                                            child: Image.asset(
                                              "assets/eyes/e1_h.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(16),
                                            child: Image.asset(
                                              "assets/eyes/e2_p.jpg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(16),
                                            child: Image.asset(
                                              "assets/eyes/e2_h.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16), // 间距
                        Text(
                          " 病症诊断",
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
                                    title: "糖尿病视网膜病变",
                                    percent: 0.899,
                                    level: SeverityLevel.General,
                                    color: Colors.white12,
                                  ),
                                  PercentCard(
                                    title: "青光眼",
                                    percent: 0.704,
                                    level: SeverityLevel.Critical,
                                    color: Colors.white12,
                                  ),
                                  PercentCard(
                                    title: "白内障",
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
                                        title: "年龄相关性黄斑变性 (AMD)",
                                        percent: 0.497,
                                        level: SeverityLevel.General,
                                        color: Colors.transparent,
                                      ),
                                      PercentInfoWidget(
                                        title: "近视",
                                        percent: 0.406,
                                        level: SeverityLevel.Critical,
                                      ),
                                      PercentInfoWidget(
                                        title: "正常",
                                        percent: 0.360,
                                        level: SeverityLevel.General,
                                      ),
                                      PercentInfoWidget(
                                        title: "高血压性视网膜病变",
                                        percent: 0.205,
                                        level: SeverityLevel.Critical,
                                      ),
                                      PercentInfoWidget(
                                        title: "其他疾病/异常",
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
                          " 详细分析",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16), // 间距
                        AnalysisCard(
                          title: "糖尿病视网膜病变",
                          percent: 0.899,
                          emphasize: true,
                          description: "模型在这名 45 岁男性患者中检测到显著的糖尿病视网膜病变迹象。视网膜表面散布着多个小而圆的微血管瘤，尤其集中在颞侧区域。所有四个象限的视网膜可见点状和斑块状出血，表明广泛的血管损伤。棉絮斑（软性渗出物）的存在提示视网膜缺血区域，而硬性渗出物（黄色沉积）以环状图案围绕渗漏的微血管瘤排列，特别威胁黄斑区。\n视盘处（NVD）和其他部位（NVE）可见新生血管化，表明已发展为增殖性糖尿病视网膜病变 (PDR)，需要紧急干预。此外，还识别出静脉串珠状改变和视网膜内微血管异常 (IRMA)，这是严重非增殖性糖尿病视网膜病变的典型标志。黄斑区显示水肿迹象，视网膜厚度增加，这可能解释患者的视力投诉。对45岁男性而言，这种模式提示可能存在长期未诊断或管理不善的糖尿病。算法通过对血管模式和病理结构的差异分析，结合数千张眼底图像的规范数据库，明确识别了这些特征。",
                        ),
                        AnalysisCard(
                          title: "青光眼",
                          percent: 0.704,
                          description: "眼底图像分析显示这名 45 岁男性存在显著的青光眼性改变。视盘显示明显的杯盘比约为 0.7-0.8，显著高于正常范围的 0.3-0.4。神经视网膜缘明显变薄，特别是在下方和上方象限（违反了 ISNT 规则的模式）。模型检测到血管在视盘边缘有刺刀样弯曲，即血管穿过挖空的视盘边缘时形成的尖锐角度。\n视盘周围存在萎缩区，形成 Beta 区，与青光眼性损伤密切相关。神经视网膜纤维层（RNFL）显示缺陷区域，表现为从视盘延伸出的暗色楔形区域。对 45 岁男性而言，这些变化过早且令人担忧，通常在晚年才会发生。算法测量了缘盘参数，并将血管模式和神经纤维层完整性与同龄对照组进行了比较，识别出特定的青光眼性模式。神经损伤的程度提示中度至重度青光眼，可能已经发展多年，直到最近才出现症状。这种模式表明需要立即控制眼压，并可能需要手术干预以防止进一步视力丧失。",
                        ),
                        AnalysisCard(
                          title: "白内障",
                          percent: 0.551,
                          description: "尽管眼底成像主要关注视网膜，模型在这名 45 岁男性患者中检测到几种间接的白内障形成迹象。整体图像质量显示出对比度和清晰度的典型降低，这超出了技术成像因素的预期范围。红光反射减弱，并且整个眼底视图覆盖着微妙的黄褐色调，提示晶状体核硬化。\n模型识别出与早期后囊下白内障形成一致的“水印”效应和阴影伪影。光散射模式提示晶状体赤道区域存在放射状的皮质不透明斑痕。对于 45 岁来说，这些变化比典型的年龄相关进程更早出现，提示可能的风险因素，例如未控制的糖尿病、长期使用皮质类固醇或大量紫外线暴露。系统通过分析数千张确诊白内障图像中的质量退化模式，识别出这些细微的透明介质不良现象。55.1% 的概率表明对早期到中度白内障变化的中等信心，这可能已经影响了视觉质量，特别是在低对比度或易眩光环境中，并可能需要进一步的裂隙灯检查以确认晶状体不透明的分类和严重程度。",
                        ),
                        AnalysisCard(
                          title: "年龄相关性黄斑变性 (AMD)",
                          percent: 0.497,
                          description: "模型在这名 45 岁男性患者中识别出早期年龄相关性黄斑变性的几个关键特征，这显著低于典型的 AMD 人群年龄。黄斑区域散布着多个小到中等大小的玻璃疣（直径 50-125 μm），表现为视网膜色素上皮（RPE）下方的黄色沉积。模型检测到细微的色素异常，包括位于黄斑旁分布的色素过度和 RPE 萎缩。\n玻璃疣边界模糊，呈现柔软外观，而不是正常老化中有时见到的硬性玻璃疣。地理萎缩尚未广泛发生，但在颞侧黄斑可见 RPE 退化的早期迹象。中央凹反射异常，提示潜在的光感受器损伤。尽管在 45 岁出现这种表现不常见，但其模式提示早发型 AMD，可能与遗传易感性（例如 CFH 或 ARMS2 基因变异）或环境风险因素（如吸烟）相关。系统量化了玻璃疣面积、分布模式和色素变化，并与不同阶段确诊 AMD 病例的模式进行了比较。49.7% 的概率反映算法对这些为 AMD 真正变化的中等信心，而不是其他黄斑病变，并建议通过 OCT 成像对其进行仔细监测以及通过生活方式调整来减缓从干性 AMD 向湿性 AMD 的进展。",
                        ),
                        AnalysisCard(
                          title: "近视",
                          percent: 0.406,
                          description: "这名 45 岁男性的眼底检查显示了病理性近视的典型特征。视盘显著扩大，呈现斜插入形态，并伴有明显的近视新月（视盘周围萎缩区）从视盘边缘向颞侧延伸。该新月表现为白色萎缩区域，脉络膜和视网膜色素上皮显著变薄，暴露出下方的巩膜。视网膜血管显示拉直模式，分支角度减小，且从视盘向周边延伸时呈现“拉伸”外观。\n黄斑区显示视网膜变薄，伴随脉络膜血管的可见性增加，形成“虎皮状”或“网纹状”眼底外观。后极部可见漆裂迹象（Bruch 膜破裂），表现为黄色线状病变。周边视网膜显示格子样变性，表现为变薄区域伴色素改变。对于 45 岁来说，这些发现表明长期轴性近视，而非近期发展。模型分析了视盘形态、血管结构和视网膜色素上皮变化，并与近视眼的规范数据库进行了比较。40.6% 的概率表明中度近视变化，未来可能增加视网膜脱离、近视黄斑变性或脉络膜新生血管化等并发症的风险，因此需要定期监测周边视网膜和黄斑。",
                        ),
                        AnalysisCard(
                          title: "正常",
                          percent: 0.360,
                          description: "尽管病理可能性较高，模型识别出这名 45 岁男性眼底图像中的若干正常特征。黄斑区域部分保留了正常的中央凹光反射和轮廓，没有严重病理中常见的破坏。一些视网膜区域（特别是鼻上象限）显示了规则的血管分支模式和健康的视网膜组织。外周视网膜显示血管逐渐变细，某些段落没有异常的扭曲。\n背景视网膜在某些区域保持相对均匀的颜色，没有严重疾病状态下常见的广泛干扰。虽然视盘存在一些可疑特征，但在鼻侧分区部分保留了神经视网膜缘。模型将这些保留下来的正常特征与病理模式和健康 45 岁男性的规范数据进行了比较。36.0% 的较低概率表明，尽管某些正常特征得以保留，整体眼底外观与该年龄组的预期健康模式显著偏离。这表明，尽管某些区域未受影响，眼睛整体上表现出显著的病理变化，加强了对特定疾病实体分配的更高概率，并强调了综合治疗和监测的重要性。",
                        ),
                        AnalysisCard(
                          title: "高血压性视网膜病变",
                          percent: 0.215,
                          description: "模型在这名 45 岁男性患者中识别出高血压性视网膜病变的细微但典型的特征。动脉狭窄明显，动静脉比（AVR）约为 1:2，而非正常值 2:3 或 1:1.5，提示长期高血压对视网膜血管的压力。动静脉交叉改变（AV 夹闭）在多个交叉点可见，表现为动脉压迫静脉的特征性“夹闭”外观，提示 2 级高血压性视网膜病变。\n模型检测到数条血管的动脉壁反光增加（铜丝样改变），提示动脉硬化和高血压引起的血管壁增厚。第二和第三级动脉尤其显示早期血管扭曲迹象。尽管缺乏火焰状出血和棉絮斑（通常见于更高级别的高血压性视网膜病变），血管结构的变化提示持续的高血压效应。对于 45 岁男性，这些发现提示早期至中度高血压变化，可能表明未诊断或控制不佳的高血压。系统根据规范数据库和高血压分类标准，分析了血管口径、分支模式和 AV 交叉现象。21.5% 的概率反映模型评估这些变化为轻至中度，但确实存在，需评估血压并进行潜在的心血管风险评估，尤其是考虑到患者的年龄和性别，使其处于高血压相关并发症的高风险类别。",
                        ),
                        AnalysisCard(
                          title: "其他疾病/异常",
                          percent: 0.100,
                          description: "模型检测到一些不完全符合其他诊断类别的细微异常。上颞弓附近的一个色素减退小区域可能代表一个陈旧的脉络视网膜瘢痕，可能由炎症或感染后遗症引起。黄斑旁区域轻微的视网膜前膜形成导致内视网膜表面的细微皱褶，这可能是特发性的或继发于其他视网膜病变。\n模型识别出血管口径过渡中的轻微不规则性，这些不符合高血压性或糖尿病性血管病变的经典模式。远周边的小、圆形、黄色病灶可能代表一个周边玻璃疣或小的脉络膜痣，需进一步表征。下视网膜的轻微色素斑驳不符合典型 AMD 模式，可能是图案营养不良或中心性浆液性视网膜病变的早期表现。对于 45 岁来说，这些发现可能是较少见视网膜病变的早期表现或正常解剖变异。系统将这些异常标记为不完全符合其主要诊断类别，占低概率的 10.0%。这些发现可能需要进一步的影像学检查，例如 OCT、自发荧光或血管造影以明确表征，但在这一阶段它们可能是偶然发现，而不是威胁视力的病变。",
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