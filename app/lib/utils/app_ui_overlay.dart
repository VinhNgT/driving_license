import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppUiOverlay {
  AppUiOverlay(this.brightness);
  final Brightness brightness;

  SystemUiOverlayStyle get statusBarOverlayStyle => SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            brightness == Brightness.light ? Brightness.dark : Brightness.light,
        statusBarBrightness:
            brightness == Brightness.light ? Brightness.dark : Brightness.light,
        systemStatusBarContrastEnforced: false,
      );

  SystemUiOverlayStyle get navigationBarOverlayStyle =>
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
      );
}
