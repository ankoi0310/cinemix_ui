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
