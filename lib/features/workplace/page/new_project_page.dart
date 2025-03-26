
import 'package:eyescare/features/workplace/page/select_image_page.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

SliverWoltModalSheetPage page1(BuildContext modalSheetContext) {
  return WoltModalSheetPage(
    hasSabGradient: false,
    topBarTitle: const Text(
      'Create a New Project',
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
          child: Center(child: Text('Next')),
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
                label: const Text('Project Name'),
                placeholder: const Text('Enter your project name'),
                description: const Text('The name of your project'),
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
                label: const Text('Patient ID'),
                placeholder: const Text('Enter patient ID'),
              ),
              const SizedBox(height: 10),
              ShadRadioGroupFormField<bool>(
                axis: Axis.horizontal,
                label: const Text('Patient Gender'),
                items: [
                  ShadRadio(
                    label: Text('Male'),
                    value: true,
                  ),
                  ShadRadio(
                    label: Text('Female'),
                    value: false,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ShadInputFormField(
                id: 'Patient Age',
                label: const Text('Patient Age'),
                placeholder: const Text('Enter patient age'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

SliverWoltModalSheetPage page2(BuildContext modalSheetContext) {
  return WoltModalSheetPage(
    hasSabGradient: false,
    topBarTitle: const Text(
      'Select an Image',
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
              child: Center(child: Text('Previous')),
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
              child: Center(child: Text('Previous')),
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