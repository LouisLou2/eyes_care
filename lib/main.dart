// import 'package:eyescare/style/app_theme.dart';
// import 'package:flutter/material.dart';
//
// import 'features/main_page/page/main_page.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: AppTheme.light,
//       darkTheme: AppTheme.dark,
//       themeMode: ThemeMode.light,
//       home: const VideoBackgroundPage(),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Step-by-Step Process'),
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   child: Icon(
//                     Icons.ice_skating,
//                   ),
//                 ),
//                 SizedBox(width: 20,),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Ph.D. in Computer Science',
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           'Stanford University  |  2004.4 - 2005.6',
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             ConstrainedBox(
//               constraints: BoxConstraints(
//                 minHeight: 30,
//               ),
//               child: IntrinsicHeight(
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 15),
//                   child: VerticalDivider(
//                     thickness: 2,
//                     width: 10,
//                   ),
//                 ),
//               ),
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   child: Icon(
//                     Icons.ice_skating,
//                   ),
//                 ),
//                 SizedBox(width: 20,),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Ph.D. in Computer Science',
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           'Stanford University  |  2004.4 - 2005.6',
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
//
// void main() {
//   runApp(const MainApp());
// }
//
// const double _bottomPaddingForButton = 150.0;
// const double _buttonHeight = 56.0;
// const double _buttonWidth = 200.0;
// const double _pagePadding = 16.0;
// const double _pageBreakpoint = 768.0;
// const double _heroImageHeight = 250.0;
// const Color _lightThemeShadowColor = Color(0xFFE4E4E4);
// const Color _darkThemeShadowColor = Color(0xFF121212);
// const Color _darkSabGradientColor = Color(0xFF313236);
// final materialColorsInGrid = allMaterialColors.take(20).toList();
// final materialColorsInSliverList = allMaterialColors.sublist(20, 25);
//
// class MainApp extends StatefulWidget {
//   const MainApp({super.key});
//
//   @override
//   State<MainApp> createState() => _MainAppState();
// }
//
// class _MainAppState extends State<MainApp> {
//   bool _isLightTheme = true;
//
//   @override
//   Widget build(BuildContext context) {
//     SliverWoltModalSheetPage page1(
//         BuildContext modalSheetContext, TextTheme textTheme) {
//       return WoltModalSheetPage(
//         hasSabGradient: false,
//         stickyActionBar: Padding(
//           padding: const EdgeInsets.all(_pagePadding),
//           child: Column(
//             children: [
//               ElevatedButton(
//                 onPressed: Navigator.of(modalSheetContext).pop,
//                 child: const SizedBox(
//                   height: _buttonHeight,
//                   width: double.infinity,
//                   child: Center(child: Text('Cancel')),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               ElevatedButton(
//                 onPressed: WoltModalSheet.of(modalSheetContext).showNext,
//                 child: const SizedBox(
//                   height: _buttonHeight,
//                   width: double.infinity,
//                   child: Center(child: Text('Next page')),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         topBarTitle: Text('Pagination', style: textTheme.titleSmall),
//         isTopBarLayerAlwaysVisible: true,
//         trailingNavBarWidget: IconButton(
//           padding: const EdgeInsets.all(_pagePadding),
//           icon: const Icon(Icons.close),
//           onPressed: Navigator.of(modalSheetContext).pop,
//         ),
//         child: const Padding(
//             padding: EdgeInsets.fromLTRB(
//               _pagePadding,
//               _pagePadding,
//               _pagePadding,
//               _bottomPaddingForButton,
//             ),
//             child: Text(
//               '''
// Pagination involves a sequence of screens the user navigates sequentially. We chose a lateral motion for these transitions. When proceeding forward, the next screen emerges from the right; moving backward, the screen reverts to its original position. We felt that sliding the next screen entirely from the right could be overly distracting. As a result, we decided to move and fade in the next page using 30% of the modal side.
// ''',
//             )),
//       );
//     }
//
//     SliverWoltModalSheetPage page2(
//         BuildContext modalSheetContext, TextTheme textTheme) {
//       return SliverWoltModalSheetPage(
//         pageTitle: Padding(
//           padding: const EdgeInsets.all(_pagePadding),
//           child: Text(
//             'Material Colors',
//             style:
//             textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
//           ),
//         ),
//         heroImage: Image(
//           image: NetworkImage(
//             'https://raw.githubusercontent.com/woltapp/wolt_modal_sheet/main/example/lib/assets/images/material_colors_hero${_isLightTheme ? '_light' : '_dark'}.png',
//           ),
//           fit: BoxFit.cover,
//         ),
//         leadingNavBarWidget: IconButton(
//           padding: const EdgeInsets.all(_pagePadding),
//           icon: const Icon(Icons.arrow_back_rounded),
//           onPressed: WoltModalSheet.of(modalSheetContext).showPrevious,
//         ),
//         trailingNavBarWidget: IconButton(
//           padding: const EdgeInsets.all(_pagePadding),
//           icon: const Icon(Icons.close),
//           onPressed: Navigator.of(modalSheetContext).pop,
//         ),
//         stickyActionBar: Padding(
//           padding: const EdgeInsets.all(_pagePadding),
//           child: ElevatedButton(
//             onPressed: Navigator.of(modalSheetContext).pop,
//             child: const SizedBox(
//               height: _buttonHeight,
//               width: double.infinity,
//               child: Center(child: Text('Close')),
//             ),
//           ),
//         ),
//         mainContentSliversBuilder: (context) => [
//           SliverGrid(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               mainAxisSpacing: 10.0,
//               crossAxisSpacing: 10.0,
//               childAspectRatio: 2.0,
//             ),
//             delegate: SliverChildBuilderDelegate(
//                   (_, index) => ColorTile(color: materialColorsInGrid[index]),
//               childCount: materialColorsInGrid.length,
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//                   (_, index) => ColorTile(color: materialColorsInSliverList[index]),
//               childCount: materialColorsInSliverList.length,
//             ),
//           ),
//           const SliverPadding(
//             padding: EdgeInsets.only(bottom: _bottomPaddingForButton),
//             sliver: SliverToBoxAdapter(
//               child: Padding(
//                 padding: EdgeInsets.all(_pagePadding),
//                 child: Text(
//                   'Last Item',
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       );
//     }
//
//     return MaterialApp(
//       themeMode: _isLightTheme ? ThemeMode.light : ThemeMode.dark,
//       theme: ThemeData.light().copyWith(
//         extensions: const <ThemeExtension>[
//           WoltModalSheetThemeData(
//             heroImageHeight: _heroImageHeight,
//             topBarShadowColor: _lightThemeShadowColor,
//             modalBarrierColor: Colors.black54,
//             mainContentScrollPhysics: ClampingScrollPhysics(),
//           ),
//         ],
//       ),
//       darkTheme: ThemeData.dark().copyWith(
//         extensions: const <ThemeExtension>[
//           WoltModalSheetThemeData(
//             topBarShadowColor: _darkThemeShadowColor,
//             modalBarrierColor: Colors.white12,
//             sabGradientColor: _darkSabGradientColor,
//             mainContentScrollPhysics: ClampingScrollPhysics(),
//           ),
//         ],
//       ),
//       home: Scaffold(
//         body: Builder(
//           builder: (context) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text('Light Theme'),
//                     Padding(
//                       padding: const EdgeInsets.all(_pagePadding),
//                       child: Switch(
//                         value: !_isLightTheme,
//                         onChanged: (_) =>
//                             setState(() => _isLightTheme = !_isLightTheme),
//                       ),
//                     ),
//                     const Text('Dark Theme'),
//                   ],
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     WoltModalSheet.show<void>(
//                       context: context,
//                       pageListBuilder: (modalSheetContext) {
//                         final textTheme = Theme.of(context).textTheme;
//                         return [
//                           page1(modalSheetContext, textTheme),
//                           page2(modalSheetContext, textTheme),
//                         ];
//                       },
//                       modalTypeBuilder: (context) {
//                         final size = MediaQuery.sizeOf(context).width;
//                         if (size < _pageBreakpoint) {
//                           return _isLightTheme
//                               ? const WoltBottomSheetType()
//                               : const WoltBottomSheetType().copyWith(
//                             shapeBorder: const BeveledRectangleBorder(),
//                           );
//                         } else {
//                           return _isLightTheme
//                               ? const WoltDialogType()
//                               : const WoltDialogType().copyWith(
//                             shapeBorder: const BeveledRectangleBorder(),
//                           );
//                         }
//                       },
//                       onModalDismissedWithBarrierTap: () {
//                         debugPrint('Closed modal sheet with barrier tap');
//                         Navigator.of(context).pop();
//                       },
//                     );
//                   },
//                   child: const SizedBox(
//                     height: _buttonHeight,
//                     width: _buttonWidth,
//                     child: Center(child: Text('Show Modal Sheet')),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class ColorTile extends StatelessWidget {
//   final Color color;
//
//   const ColorTile({super.key, required this.color});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: color,
//       height: 600,
//       child: Center(
//         child: Text(
//           color.toString(),
//           style: TextStyle(
//             color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// List<Color> get allMaterialColors {
//   List<Color> allMaterialColorsWithShades = [];
//
//   for (MaterialColor color in Colors.primaries) {
//     allMaterialColorsWithShades.add(color.shade100);
//     allMaterialColorsWithShades.add(color.shade200);
//     allMaterialColorsWithShades.add(color.shade300);
//     allMaterialColorsWithShades.add(color.shade400);
//     allMaterialColorsWithShades.add(color.shade500);
//     allMaterialColorsWithShades.add(color.shade600);
//     allMaterialColorsWithShades.add(color.shade700);
//     allMaterialColorsWithShades.add(color.shade800);
//     allMaterialColorsWithShades.add(color.shade900);
//   }
//   return allMaterialColorsWithShades;
// }


// import 'package:flutter/material.dart';
//
// /// Flutter code sample for [showGeneralDialog].
//
// void main() => runApp(const GeneralDialogApp());
//
// class GeneralDialogApp extends StatelessWidget {
//   const GeneralDialogApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(restorationScopeId: 'app', home: GeneralDialogExample());
//   }
// }
//
// class GeneralDialogExample extends StatelessWidget {
//   const GeneralDialogExample({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: OutlinedButton(
//           onPressed: () {
//             /// This shows an alert dialog.
//             Navigator.of(context).restorablePush(_dialogBuilder);
//           },
//           child: const Text('Open Dialog'),
//         ),
//       ),
//     );
//   }
//
//   @pragma('vm:entry-point')
//   static Route<Object?> _dialogBuilder(BuildContext context, Object? arguments) {
//     return RawDialogRoute<void>(
//       pageBuilder: (
//           BuildContext context,
//           Animation<double> animation,
//           Animation<double> secondaryAnimation,
//           ) {
//         return const AlertDialog(title: Text('Alert!'));
//       },
//     );
//   }
// }
import 'package:eyescare/features/control_page/page/control_framework.dart';
import 'package:eyescare/features/main_page/page/main_page.dart';
import 'package:eyescare/features/sign_in/page/sign_in_page.dart';
import 'package:eyescare/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.material(
      materialThemeBuilder: (context, theme) {
        return AppTheme.dark;
      },
      theme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: ShadNeutralColorScheme.dark(),
      ),
      themeMode: ThemeMode.dark,
      routes: {
        '/sign_in': (context) => const SignInScreen(),
        '/studio': (context) => const StudioPage(),
      },
      home: Material(
        child: const IntroPage(),
      )
    );
  }
}
