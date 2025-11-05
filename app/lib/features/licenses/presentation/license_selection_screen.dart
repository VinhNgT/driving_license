import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/button_card.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/licenses/data/providers/user_selected_license_provider.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vector_graphics/vector_graphics.dart';

@RoutePage()
class LicenseSelectionScreen extends HookConsumerWidget {
  const LicenseSelectionScreen({
    super.key,
    this.afterLicenseSelected,
    this.navigateToHomeAfterLicenseSelected = true,
  });
  final VoidCallback? afterLicenseSelected;
  final bool navigateToHomeAfterLicenseSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: kSize_16,
              right: kSize_16,
              bottom: kSize_48,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(96),
                Text(
                  'Chọn loại bằng lái',
                  style: context.textTheme.headlineMedium,
                ),
                const Gap(28),
                LicenseSelection(
                  onLicenseSelected: (license) async {
                    await ref
                        .read(userSelectedLicenseProvider.notifier)
                        .selectLicense(license);

                    afterLicenseSelected?.call();
                    if (navigateToHomeAfterLicenseSelected && context.mounted) {
                      await context.navigateTo(const HomeRoute());
                    }
                  },
                ),
                const Gap(kSize_16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => _openPrivacyPolicy(context),
                      child: const Text('Chính sách bảo mật'),
                    ),
                    TextButton(
                      onPressed: () => _openLicenses(context),
                      child: const Text('Giấy phép sử dụng'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openPrivacyPolicy(BuildContext context) {
    context.pushRoute(
      AppLicenseRoute(
        htmlAssetPath: 'assets/app_licenses/privacy_policy.html',
      ),
    );
  }

  void _openLicenses(BuildContext context) {
    context.pushRoute(
      AppLicenseRoute(htmlAssetPath: 'assets/app_licenses/licenses.html'),
    );
  }
}

class LicenseSelection extends StatelessWidget {
  const LicenseSelection({super.key, required this.onLicenseSelected});
  final void Function(License license) onLicenseSelected;

  @override
  Widget build(BuildContext context) {
    final licenseSelections = License.values.toList()..remove(License.all);

    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: licenseSelections.length,
      separatorBuilder: (context, index) => kGap_12,
      shrinkWrap: true,
      itemBuilder: (context, index) => LicenseCard(
        license: licenseSelections[index],
        onPressed: () => onLicenseSelected(licenseSelections[index]),
      ),
    );
  }
}

class LicenseCard extends HookConsumerWidget {
  const LicenseCard({
    super.key,
    required this.license,
    required this.onPressed,
  });
  final License license;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ButtonCard(
      surfaceColor: context.materialScheme.surfaceContainerHigh,
      onSurfaceColor: context.materialScheme.onSurface,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        child: Row(
          children: [
            SvgPicture(AssetBytesLoader(license.iconAssetPath)),
            kGap_20,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _getLicenseName(license),
                    style: context.textTheme.titleMedium,
                  ),
                  kGap_2,
                  Text(
                    _getLicenseDescription(license),
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getLicenseName(License license) {
    final StringBuffer buffer = StringBuffer('Bằng' ' ');
    final licenseCode = license.name.toUpperCase();
    buffer.write(licenseCode);
    return buffer.toString();
  }

  String _getLicenseDescription(License license) {
    return switch (license) {
      License.a1 => 'Xe mô tô có dung tích xi lanh dưới 175cm3',
      License.a2 => 'Xe mô tô có dung tích xi lanh từ 175cm3 trở lên',
      License.a3 => 'Xe mô tô 3 bánh',
      License.a4 => 'Máy kéo trọng tải đến 1000kg',
      License.b1 =>
        'Xe ô tô đến 9 chỗ ngồi, trọng tải dưới 3.500kg, không được hành nghề '
            'lái xe',
      License.b2 =>
        'Xe ô tô đến 9 chỗ ngồi, trọng tải dưới 3.500kg, được hành nghề lái xe',
      License.all => 'Tất cả các loại xe',
    };
  }
}
