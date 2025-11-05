// ignore_for_file: lines_longer_than_80_chars

import 'package:driving_license/theme/theme.dart';
import 'package:flutter/material.dart';

extension ContextGetExtension on BuildContext {
  Brightness get brightness => Theme.of(this).brightness;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  MaterialScheme get materialScheme {
    return switch (Theme.of(this).brightness) {
      Brightness.light => MaterialTheme.lightScheme,
      Brightness.dark => MaterialTheme.darkScheme,
    };
  }

  Size get size => MediaQuery.of(this).size;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;
  double get appBarHeight => AppBarTheme.of(this).toolbarHeight!;
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;
  EdgeInsets get systemGestureInsets => MediaQuery.of(this).systemGestureInsets;

  TextStyle get defaultTextStyle => DefaultTextStyle.of(this).style;
  TextScaler get textScaler => MediaQuery.of(this).textScaler;

  // bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;
  // bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;
  // bool get isMobile => MediaQuery.of(this).size.width < 600;
  // bool get isTablet => MediaQuery.of(this).size.width >= 600;
  // bool get isDesktop => MediaQuery.of(this).size.width >= 1440;
  // bool get isBigScreen => MediaQuery.of(this).size.width >= 1440;
  // bool get isNarrow => MediaQuery.of(this).size.width < 600;
  // bool get isMedium => MediaQuery.of(this).size.width >= 600 && MediaQuery.of(this).size.width < 1440;
  // bool get isWide => MediaQuery.of(this).size.width >= 1440;
  // bool get isVeryWide => MediaQuery.of(this).size.width >= 2560;
  // bool get isVeryVeryWide => MediaQuery.of(this).size.width >= 3440;
  // bool get isMobilePortrait => isMobile && isPortrait;
  // bool get isMobileLandscape => isMobile && isLandscape;
  // bool get isTabletPortrait => isTablet && isPortrait;
  // bool get isTabletLandscape => isTablet && isLandscape;
  // bool get isDesktopPortrait => isDesktop && isPortrait;
  // bool get isDesktopLandscape => isDesktop && isLandscape;
}

extension ContextMethodExtention on BuildContext {
  void removeFocus() {
    final FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void showSnackBar(SnackBar snackBar) {
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
