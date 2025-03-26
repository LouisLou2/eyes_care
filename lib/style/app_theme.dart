import 'package:eyescare/style/app_style.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/// The [AppTheme] defines light and dark themes for the app.
///
/// Theme setup for FlexColorScheme package v8.
/// Use same major flex_color_scheme package version. If you use a
/// lower minor version, some properties may not be supported.
/// In that case, remove them after copying this theme to your
/// app or upgrade package to version 8.1.1.
///
/// Use in [MaterialApp] like this:
///
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
/// );
abstract final class AppTheme {
  // The defined light theme.
  static ThemeData light = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xFF1145A4),
      primaryContainer: Color(0xFFADC7F7),
      primaryLightRef: Color(0xFF1145A4),
      secondary: Color(0xFFB61D1D),
      secondaryContainer: Color(0xFFEDA0A0),
      secondaryLightRef: Color(0xFFB61D1D),
      tertiary: Color(0xFF376BCA),
      tertiaryContainer: Color(0xFFCFDCF2),
      tertiaryLightRef: Color(0xFF376BCA),
      appBarColor: Color(0xFFCFDCF2),
      error: Color(0xFFB00020),
      errorContainer: Color(0xFFFCD9DF),
    ),
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    fontFamily: AppStyle.fontFamily1,
  );
  // The defined dark theme.
  static ThemeData dark = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: Color(0xFFC5D8F9),
      primaryContainer: Color(0xFF587DBF),
      primaryLightRef: Color(0xFF1145A4),
      secondary: Color(0xFFF2BCBC),
      secondaryContainer: Color(0xFFCC6161),
      secondaryLightRef: Color(0xFFB61D1D),
      tertiary: Color(0xFFDEE6F6),
      tertiaryContainer: Color(0xFF7397DA),
      tertiaryLightRef: Color(0xFF376BCA),
      appBarColor: Color(0xFFDEE6F6),
      error: Color(0x00000000),
      errorContainer: Color(0x00000000),
    ),
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    fontFamily: AppStyle.fontFamily1,
  );
}