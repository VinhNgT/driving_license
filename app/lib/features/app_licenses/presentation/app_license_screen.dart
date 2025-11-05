import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class AppLicenseScreen extends HookConsumerWidget {
  const AppLicenseScreen({super.key, required this.htmlAssetPath});
  final String htmlAssetPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewTitle = useState<String?>(null);

    final controller = useRef(WebViewController()).value;
    useEffect(
      () {
        controller.setNavigationDelegate(
          NavigationDelegate(
            onPageFinished: (url) async =>
                viewTitle.value = await controller.getTitle(),
            onNavigationRequest: (request) => _onNavigationRequestHandler(
              request,
              context,
            ),
          ),
        );

        controller.loadFlutterAsset(htmlAssetPath);
        return null;
      },
      [controller],
    );

    return Scaffold(
      appBar: CommonAppBar(
        title: viewTitle.value != null ? Text(viewTitle.value!) : null,
        backgroundColor: context.materialScheme.surfaceContainer,
      ),
      body: SafeArea(child: WebViewWidget(controller: controller)),
    );
  }

  FutureOr<NavigationDecision> _onNavigationRequestHandler(
    NavigationRequest request,
    BuildContext context,
  ) async {
    final Uri uri = Uri.parse(request.url);

    if (!await canLaunchUrl(uri) && context.mounted) {
      context.showSnackBar(
        const SnackBar(
          content: Text('Thiết bị của bạn không hỗ trợ liên kết này'),
        ),
      );
      return NavigationDecision.prevent;
    }

    if (!request.url.startsWith('file://')) {
      await launchUrl(uri);
      return NavigationDecision.prevent;
    }

    return NavigationDecision.navigate;
  }
}
