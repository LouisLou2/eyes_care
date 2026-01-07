
import 'package:eyescare/features/control_page/page/control_framework.dart';
import 'package:eyescare/features/workplace/page/select_image_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

SliverWoltModalSheetPage page1(BuildContext modalSheetContext) {
  return WoltModalSheetPage(
    hasSabGradient: false,
    topBarTitle: const Text(
      '新建项目',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
    isTopBarLayerAlwaysVisible: true,
    navBarHeight: 60,
    stickyActionBar: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 16),
      child: OutlinedButton(
        onPressed: WoltModalSheet.of(modalSheetContext).showNext,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.deepOrangeAccent,
          side: const BorderSide(color: Colors.deepOrangeAccent),
        ),
        child: const SizedBox(
          width: double.infinity,
          child: Center(child: Text('下一步')),
        ),
      ),
    ),
    trailingNavBarWidget: IconButton(
      padding: const EdgeInsets.all(16),
      icon: const Icon(Icons.close),
      onPressed: Navigator.of(modalSheetContext).pop,
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(70, 30, 70, 80),
      child: ShadForm(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 350),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ShadInputFormField(
                id: 'projectName',
                label: const Text('项目名称'),
                placeholder: const Text('为项目命名'),
                description: const Text('项目的唯一名称'),
                validator: (v) {
                  if (v.length < 2) {
                    return 'Username must be at least 2 characters.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ShadInputFormField(
                id: 'PatientId',
                label: const Text('患者编号'),
                placeholder: const Text('输入患者编号'),
              ),
              const SizedBox(height: 10),
              ShadRadioGroupFormField<bool>(
                axis: Axis.horizontal,
                label: const Text('患者性别'),
                items: [
                  ShadRadio(
                    label: Text('男'),
                    value: true,
                  ),
                  ShadRadio(
                    label: Text('女'),
                    value: false,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ShadInputFormField(
                id: '患者年龄',
                label: const Text('患者年龄'),
                placeholder: const Text('输入患者年龄'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

SliverWoltModalSheetPage page2(BuildContext modalSheetContext, BuildContext con) {
  return WoltModalSheetPage(
    hasSabGradient: false,
    topBarTitle: const Text(
      '选择图片 (左眼)',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
    isTopBarLayerAlwaysVisible: true,
    navBarHeight: 60,
    trailingNavBarWidget: IconButton(
      padding: const EdgeInsets.all(16),
      icon: const Icon(Icons.close),
      onPressed: Navigator.of(modalSheetContext).pop,
    ),
    stickyActionBar: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: WoltModalSheet.of(modalSheetContext).showPrevious,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.deepOrangeAccent,
                side: const BorderSide(color: Colors.deepOrangeAccent),
              ),
              child: Center(child: Text('上一步')),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: OutlinedButton(
              onPressed: WoltModalSheet.of(modalSheetContext).showNext,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.deepOrangeAccent,
                side: const BorderSide(color: Colors.deepOrangeAccent),
              ),
              child: Center(child: Text('下一步')),
            ),
          ),
        ],
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(70, 30, 70, 80),
      child: SelectImagePage(),
    ),
  );
}

SliverWoltModalSheetPage page3(BuildContext modalSheetContext, BuildContext con) {
  return WoltModalSheetPage(
    hasSabGradient: false,
    topBarTitle: const Text(
      '选择图片 (右眼)',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
    isTopBarLayerAlwaysVisible: true,
    navBarHeight: 60,
    trailingNavBarWidget: IconButton(
      padding: const EdgeInsets.all(16),
      icon: const Icon(Icons.close),
      onPressed: Navigator.of(modalSheetContext).pop,
    ),
    stickyActionBar: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: WoltModalSheet.of(modalSheetContext).showPrevious,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.deepOrangeAccent,
                side: const BorderSide(color: Colors.deepOrangeAccent),
              ),
              child: Center(child: Text('上一步')),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: OutlinedButton(
              onPressed: (){
                Navigator.of(modalSheetContext).pop();
                con.read<StudioProv>().setAnalysisState(AnalysisState.analyzing);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.deepOrangeAccent,
                side: const BorderSide(color: Colors.deepOrangeAccent),
              ),
              child: Center(child: Text('完成')),
            ),
          ),
        ],
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(70, 30, 70, 80),
      child: SelectImagePage(),
    ),
  );
}