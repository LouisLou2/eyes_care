
import 'dart:math';

import 'package:eyescare/features/history/page/history_page.dart';
import 'package:eyescare/features/piazza/page/piazza_page.dart';
import 'package:eyescare/features/workplace/page/analysis_result_page.dart';
import 'package:eyescare/features/workplace/page/workplace_welcome_page.dart';
import 'package:eyescare/shared/widget/sidebar/sidebar.dart';
import 'package:eyescare/shared/widget/sidebar/sidebar_item.dart';
import 'package:eyescare/style/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ValueNotifier<int> _activeTab = ValueNotifier<int>(0);

  final List<SidebarItem> items = [
    SidebarItem(
      icon: Icons.home,
      text: 'Workplace',
    ),
    SidebarItem(
      icon: Icons.notifications,
      text: 'Piazza',
    ),
    SidebarItem(
      icon: Icons.person,
      text: 'History',
    ),
    SidebarItem(
      icon: Icons.abc,
      text: 'Notification',
    ),
    SidebarItem(
      icon: Icons.settings,
      text: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Row(
          children: [
            AnimatedSidebar(
              margin: EdgeInsets.zero,
              expanded: MediaQuery.of(context).size.width > 600,
              items: items,
              selectedIndex: _activeTab.value,
              autoSelectedIndex: false,
              onItemSelected: (index) => setState(() => _activeTab.value = index),
              duration: const Duration(milliseconds: 300),
              frameDecoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              minSize: 90,
              maxSize: 180,
              itemIconSize: 22,
              itemIconColor: Colors.white,
              itemHoverColor: Colors.grey.withOpacity(0.2),
              itemSelectedColor: Colors.grey.withOpacity(0.3),
              itemTextStyle: const TextStyle(color: Colors.white, fontSize: 15),
              itemSelectedBorder: const BorderRadius.all(
                Radius.circular(10),
              ),
              itemMargin: 14,
              itemSpaceBetween: 10,
              headerImageName: 'assets/image/logo.png',
              headerIconSize: 58,
              switchIconExpanded: CupertinoIcons.arrow_left_right_square,
              switchIconCollapsed: CupertinoIcons.arrow_left_right_square_fill,
            ),
            Expanded(
              child: Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                appBar: AppBar(
                  actionsPadding: EdgeInsets.zero,
                  title: ValueListenableBuilder<int>(
                    valueListenable: _activeTab,
                    builder: (context, index, child) {
                      return Text(items[index].text);
                    },
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.all(14),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  titleTextStyle: const TextStyle(
                    fontFamily: AppStyle.fontFamily2,
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                body: Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                    ),
                    // 只有左和上
                    border: Border(
                      left: BorderSide(
                        color: Colors.white24,
                        width: 1.2,
                      ),
                      top: BorderSide(
                        color: Colors.white24,
                        width: 1.2,
                      ),
                    ),
                  ),
                  child: const AnalysisResultPage(hasResult: false),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}