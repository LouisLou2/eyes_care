import 'package:eyescare/features/history/page/history_page.dart';
import 'package:eyescare/features/piazza/page/piazza_page.dart';
import 'package:eyescare/features/workplace/page/analysis_result_page.dart';
import 'package:eyescare/features/workplace/page/workplace_welcome_page.dart';
import 'package:eyescare/shared/widget/sidebar/sidebar.dart';
import 'package:eyescare/shared/widget/sidebar/sidebar_item.dart';
import 'package:eyescare/style/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AnalysisState{
  waiting,
  analyzing,
  done,
}

final class StudioProv with ChangeNotifier {
  int _activeTab = 0;
  AnalysisState _analysisState = AnalysisState.waiting;

  int get activeTab => _activeTab;
  AnalysisState get analysisState => _analysisState;

  void setActiveTab(int index) {
    _activeTab = index;
    notifyListeners();
  }

  void setAnalysisState(AnalysisState state) {
    _activeTab = 0;
    _analysisState = state;
    notifyListeners();
  }
}


class StudioPage extends StatefulWidget {
  const StudioPage({super.key});

  @override
  State<StudioPage> createState() => _StudioPageState();
}

class _StudioPageState extends State<StudioPage> {

  final List<SidebarItem> items = [
    SidebarItem(
      icon: Icons.home,
      text: '工作',
    ),
    SidebarItem(
      icon: Icons.notifications,
      text: '讨论',
    ),
    SidebarItem(
      icon: Icons.person,
      text: '历史',
    ),
    SidebarItem(
      icon: Icons.abc,
      text: '通知',
    ),
    SidebarItem(
      icon: Icons.settings,
      text: '设置',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => StudioProv(),
          builder: (context, child) {
            return Row(
              children: [
                AnimatedSidebar(
                  margin: EdgeInsets.zero,
                  expanded: MediaQuery.of(context).size.width > 600,
                  items: items,
                  selectedIndex: context.watch<StudioProv>().activeTab,
                  autoSelectedIndex: false,
                  onItemSelected: (index) => context.read<StudioProv>().setActiveTab(index),
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
                        automaticallyImplyLeading: false,
                        actionsPadding: EdgeInsets.zero,
                        title: Selector<StudioProv, int>(
                          selector: (context, prov) => prov.activeTab,
                          builder: (context, index, child) {
                            return Text(
                              items[index].text,
                            );
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
                        child: Selector<StudioProv, int>(
                          selector: (context, prov) => prov.activeTab,
                          builder: (context, index, child) {
                            switch (index) {
                              case 0:
                                return Selector<StudioProv, AnalysisState>(
                                  selector: (context, prov) => prov.analysisState,
                                  builder: (context, state, child) {
                                    switch (state) {
                                      case AnalysisState.waiting:
                                        return WorkplaceWelcomePage();
                                      case AnalysisState.analyzing:
                                        return AnalysisResultPage(hasResult: false,);
                                      case AnalysisState.done:
                                        return AnalysisResultPage(hasResult: true,);
                                    }
                                  },
                                );
                              case 1:
                                return MedicalFeedScreen();
                              case 2:
                                return HistoryPage();
                              default:
                                return Center(
                                  child: Text(
                                    'Page ${index + 1}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                );
                            }
                          },
                        ),
                      ),
                    )
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}