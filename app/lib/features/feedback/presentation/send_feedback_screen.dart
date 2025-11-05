import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:driving_license/backend/in_app_purchase/data/purchases_repository.dart';
import 'package:driving_license/common_widgets/async_value/async_snapshot_controller.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/feedback/domain/feedback_form.dart';
import 'package:driving_license/features/feedback/presentation/send_feedback_controller.dart';
import 'package:driving_license/features/home/presentation/debug_menu_controller.dart';
import 'package:driving_license/features/home/presentation/review_cta_card_controller.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:driving_license/utils/extensions/async_snapshot_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class SendFeedbackScreen extends HookConsumerWidget {
  const SendFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(sendFeedbackControllerProvider);

    final pendingFuture = useState<Future<void>?>(null);
    final snapshot = useFuture(pendingFuture.value);

    final formKey = useMemoized(GlobalKey<FormBuilderState>.new);
    final emailText = useValueNotifier<String?>(null);
    final isFormSubmitted = useState<Set<String>>({});

    useValueChanged<SnapshotState, void>(snapshot.state,
        (previousState, oldResult) {
      if (snapshot.state == SnapshotState.error) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.showSnackBar(
            const SnackBar(
              content: Text('Gửi phản hồi thất bại'),
            ),
          );
        });
      }

      if (previousState == SnapshotState.loading &&
          snapshot.state == SnapshotState.done) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.showSnackBar(
            const SnackBar(
              content: Text('Gửi phản hồi thành công'),
            ),
          );
        });
      }
    });

    return GestureDetector(
      onTap: () => context.removeFocus(),
      child: Scaffold(
        appBar: CommonAppBar(
          backgroundColor: context.materialScheme.surfaceContainer,
          title: GestureDetector(
            onLongPress: () =>
                ref.read(debugMenuControllerProvider.notifier).trigger(),
            child: const Text('Báo lỗi'),
          ),
          actions: [
            TextButton(
              child: const Text('Gửi'),
              onPressed: () async {
                // Validate form, only allow continue if all fields are valid
                isFormSubmitted.value.addAll(formKey.currentState!.fields.keys);
                if (!formKey.currentState!.saveAndValidate()) {
                  return;
                }

                // Hide on-screen keyboard
                context.removeFocus();

                // Creat a feedback form
                final feedbackForm = await FeedbackForm.create(
                  email: formKey.currentState?.value['email'] as String?,
                  feedback: formKey.currentState!.value['content'] as String,
                );

                // Call the controller to submit the feedback
                final submitFeedbackFuture =
                    controller.submitFeedback(feedbackForm);

                // Track its progress
                pendingFuture.value = submitFeedbackFuture;
              },
            ),
          ],
          rightPadding: AppBarRightPadding.normalButton,
        ),
        body: AsyncSnapshotController(
          snapshot: snapshot,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kSize_16,
                vertical: kSize_24,
              ),
              child: FormBuilder(
                key: formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'email',
                      enableSuggestions: true,
                      autofillHints: const [AutofillHints.email],
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      valueTransformer: (value) => value?.trim(),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Symbols.email),
                        suffixIcon: ValueListenableBuilder(
                          valueListenable: emailText,
                          builder: (context, value, child) =>
                              (value?.isEmpty ?? true)
                                  ? const SizedBox.shrink()
                                  : child!,
                          child: UnconstrainedBox(
                            child: IconButton(
                              onPressed: () {
                                formKey.currentState?.fields['email']
                                    ?.didChange(null);
                              },
                              icon: const Icon(Symbols.close),
                            ),
                          ),
                        ),
                        label: const Text('Email (không bắt buộc)'),
                      ),
                      validator: (value) =>
                          isFormSubmitted.value.contains('email')
                              ? FormBuilderValidators.email(
                                  errorText: 'Email không hợp lệ',
                                )(value)
                              : null,
                      onChanged: (value) {
                        emailText.value = value;
                        isFormSubmitted.value.remove('email');
                      },
                    ),
                    kGap_24,
                    Flexible(
                      fit: FlexFit.loose,
                      child: FormBuilderTextField(
                        name: 'content',
                        minLines: 6,
                        maxLines: null,
                        enableSuggestions: true,
                        maxLength: 300,
                        textCapitalization: TextCapitalization.sentences,
                        valueTransformer: (value) => value?.trim(),
                        textAlignVertical: TextAlignVertical.top,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          hintText: 'Nêu ý kiến đóng góp của bạn',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: Text('Nội dung'),
                        ),
                        validator: (value) =>
                            isFormSubmitted.value.contains('content')
                                ? FormBuilderValidators.required(
                                    errorText: 'Nội dung không được để trống',
                                  )(value)
                                : null,
                        onChanged: (value) =>
                            isFormSubmitted.value.remove('content'),
                      ),
                    ),
                    const DebugButtons(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DebugButtons extends HookConsumerWidget {
  const DebugButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debugMenuEnable = ref.watch(debugMenuControllerProvider);

    if (!debugMenuEnable) {
      return const SizedBox.shrink();
    }

    return Wrap(
      children: [
        TextButton(
          child: const Text('Print all purchases'),
          onPressed: () {
            ref.read(purchasesRepositoryProvider).printAllPurchases();
          },
        ),
        TextButton(
          child: const Text('Clear all purchases'),
          onPressed: () {
            ref.read(purchasesRepositoryProvider).clearAllPurchases();
          },
        ),
        TextButton(
          child: const Text('Show review cta card'),
          onPressed: () {
            ref.read(reviewCtaCardControllerFutureProvider).showReviewCtaCard();
          },
        ),
      ],
    );
  }
}
