import 'package:flutter/services.dart';

enum AppFlavor {
  dev,
  iapTest,
  prod;
}

bool isAppBuiltWithFlavor(AppFlavor flavor) {
  return appFlavor == flavor.name;
}
