import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:flutter/material.dart';

class PlaceholderScaffold extends StatelessWidget {
  const PlaceholderScaffold({super.key, this.content});
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: SizedBox.expand(
        child: content,
      ),
    );
  }
}
