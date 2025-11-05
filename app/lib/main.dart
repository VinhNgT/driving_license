import 'package:driving_license/bootstrap/bootstrap.dart';
import 'package:driving_license/bootstrap/bootstrap_delegate.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const bootstrap = Bootstrap(ProductionBootstrapDelegate());
  final app = await bootstrap.initApp();
  runApp(app);
}
