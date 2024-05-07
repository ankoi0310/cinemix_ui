import 'package:cinemix_ui/core/shared/constants/app_constant.dart';
import 'package:cinemix_ui/src/checkout/presentation/widgets/payment_method_card.dart';
import 'package:flutter/material.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phương thức thanh toán',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        ...demoPaymentMethods.map(
          (paymentMethod) {
            return InkWell(
              splashColor: Colors.transparent,
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
      ],
    );
  }
}
