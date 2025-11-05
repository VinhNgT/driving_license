import 'package:auto_route/auto_route.dart';
import 'package:driving_license/backend/in_app_purchase/data/iap_providers.dart';
import 'package:driving_license/backend/in_app_purchase/domain/iap_product_purchase.dart';
import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/common_widgets/widget_deadzone.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/donate/presentation/donate_screen_controller.dart';
import 'package:driving_license/features/donate/presentation/purchase_item_card.dart';
import 'package:driving_license/logging/error_loggers/future_callback_error_logger.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:driving_license/utils/extensions/async_snapshot_ext.dart';
import 'package:driving_license/utils/list_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vector_graphics/vector_graphics.dart';

@RoutePage()
class DonateScreen extends HookConsumerWidget {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    ref.listen(isUserDonatedProvider, (previous, next) {
      if (previous?.value == false && next.value == true) {
        context.maybePop();
      }
    });

    return Scaffold(
      appBar: CommonAppBar(
        title: const Text('Đóng góp'),
        scaffoldBodyScrollController: scrollController,
      ),
      body: WidgetDeadzone(
        deadzone: EdgeInsets.only(bottom: context.systemGestureInsets.bottom),
        child: SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.only(
            top: kSize_4,
            bottom: kSize_24,
            left: kSize_16,
            right: kSize_16,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Column(
                children: [
                  const SvgPicture(
                    AssetBytesLoader(
                      'assets/icons/donation/_compiled/donate.svg.vec',
                    ),
                    height: 96,
                  ),
                  kGap_24,
                  Text(
                    'Cảm ơn bạn đã sử dụng ứng dụng',
                    style: context.textTheme.titleMedium,
                  ),
                  kGap_20,
                  const Text(
                    '''
Ứng dụng hiện tại chỉ hiển thị quảng cáo ở một số nơi nhất định, không hiển thị bất ngờ làm lãng phí thời gian của bạn, gây mất tập trung trong quá trình học.

Bằng việc thực hiện đóng góp, bạn sẽ giúp nhà phát triển không phải phụ thuộc vào nguồn thu từ quảng cáo, nâng cao trải nghiệm cho tất cả mọi người.

Toàn bộ quảng cáo trên ứng dụng sẽ được loại bỏ sau khi giao dịch thành công. Lưu ý bạn chỉ có thể thực hiện đóng góp 1 lần.''',
                  ),
                  // kGap_32,
                  kGap_24,
                  const Divider(),
                  kGap_24,
                  const PurchaseItemsList(),
                  kGap_8,
                  TextButton.icon(
                    style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(
                        context.materialScheme.error,
                      ),
                    ),
                    icon: const Icon(Icons.settings_backup_restore),
                    label: const Text('Khôi phục thanh toán'),
                    onPressed: () => ref.read(iapProvider).restorePurchases(),
                  ),
                  kGap_8,
                  Text(
                    'Hãy nhấn \'Khôi phục thanh toán\' nếu bạn đã đóng góp '
                    'thành công mà ứng dụng chưa loại bỏ quảng cáo hoặc bạn '
                    'chuyển sang thiết bị mới.',
                    style: context.textTheme.bodySmall!.copyWith(
                      color: context.materialScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PurchaseItemsList extends HookConsumerWidget {
  const PurchaseItemsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(purchaseItemsListControllerProvider);
    final iapProductsList = ref.watch(donateProductListFutureProvider);

    final pendingFutureFunction = useState<Future Function()?>(null);
    final snapshot = useFutureCallbackErrorLogger(pendingFutureFunction.value);

    useValueChanged<SnapshotState, void>(snapshot.state, (
      previousState,
      oldResult,
    ) {
      if (snapshot.state == SnapshotState.error) {
        _showSnackBar(context, 'Giao dịch không thành công');
      }

      if (previousState == SnapshotState.loading &&
          snapshot.state == SnapshotState.done &&
          snapshot.hasData) {
        if (snapshot.data == IapProductPurchaseState.purchased) {
          _showSnackBar(context, 'Đóng góp thành công, cảm ơn bạn!');
        }

        if (snapshot.data == IapProductPurchaseState.pending) {
          _showSnackBar(context, 'Giao dịch đang chờ xử lý');
        }
      }
    });

    return AsyncValueWidget(
      value: iapProductsList,
      builder: (iapProductsListValue) => Column(
        children: <Widget>[
          for (final product in iapProductsListValue)
            PurchaseItemCard(
              product: product,
              purchaseProductCallback: () async {
                final isUserDonated = await ref.read(
                  isUserDonatedProvider.future,
                );

                if (!context.mounted) {
                  return;
                }

                if (isUserDonated) {
                  _showSnackBar(context, 'Bạn đã thực hiện đóng góp trước đó');
                  return;
                }

                if (snapshot.state == SnapshotState.loading) {
                  _showSnackBar(context, 'Giao dịch trước đó đang chờ xử lý');
                  return;
                }

                pendingFutureFunction.value = () =>
                    controller.buyProduct(product);
              },
            ),
        ].separated(kGap_16),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.showSnackBar(SnackBar(content: Text(message)));
    });
  }
}
