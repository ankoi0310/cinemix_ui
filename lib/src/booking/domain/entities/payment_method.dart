import 'package:cinemix_ui/core/res/media/media.dart';
import 'package:equatable/equatable.dart';

class PaymentMethod extends Equatable {
  const PaymentMethod({
    required this.id,
    required this.imagePath,
    required this.title,
    this.subtitle,
    this.isDefault = false,
  });

  final int id;
  final String imagePath;
  final String title;
  final String? subtitle;
  final bool isDefault;

  @override
  List<Object?> get props => [
        id,
        imagePath,
        title,
        subtitle,
        isDefault,
      ];
}

const List<PaymentMethod> kPaymentMethods = [
  PaymentMethod(
    id: 1,
    imagePath: KAppMedia.zaloPay,
    title: 'ZaloPay',
  ),
  PaymentMethod(
    id: 2,
    imagePath: KAppMedia.momo,
    title: 'MoMo',
  ),
  PaymentMethod(
    id: 3,
    imagePath: KAppMedia.shopeePay,
    title: 'ShopeePay',
    isDefault: true,
  ),
  PaymentMethod(
    id: 4,
    imagePath: KAppMedia.atm,
    title: 'Thẻ ATM',
  ),
  PaymentMethod(
    id: 5,
    imagePath: KAppMedia.international,
    title: 'Thanh toán quốc tế',
    subtitle: '(Visa, MasterCard, JCB, Amex...)',
  ),
];
