import 'package:cinemix_ui/core/shared/utils/app_util.dart';
import 'package:cinemix_ui/src/booking/domain/entities/payment_method.dart';
import 'package:cinemix_ui/src/booking/presentation/widgets/payment_method_card.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({super.key});

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  int? selectedPaymentMethodId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Phương thức thanh toán',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        // TODO(paymentMethod): Replace with user's payment methods
        ...kPaymentMethods.map(
          (paymentMethod) {
            return InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  selectedPaymentMethodId = paymentMethod.id;
                });
              },
              child: PaymentMethodCard(
                imagePath: paymentMethod.imagePath,
                title: paymentMethod.title,
                subtitle: paymentMethod.subtitle,
                onTap: () {},
                isSelected: (selectedPaymentMethodId == null &&
                        paymentMethod.isDefault) ||
                    (selectedPaymentMethodId != null &&
                        selectedPaymentMethodId == paymentMethod.id),
              ),
            );
          },
        ),
        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            // TODO(addPaymentMethod): Navigate to add payment method screen
            // But now show alert this feature is not available
            AppUtil.showSnackBar(context, 'Chức năng này hiện không khả dụng');
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: DottedBorder(
              borderType: BorderType.RRect,
              padding: const EdgeInsets.all(12),
              radius: const Radius.circular(12),
              borderPadding: const EdgeInsets.symmetric(horizontal: 1),
              color: Theme.of(context).colorScheme.primary,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Row(
                  children: [
                    Icon(
                      IconsaxPlusLinear.add_square,
                      size: 24,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Thêm phương thức thanh toán',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
