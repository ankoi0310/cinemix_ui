import 'package:equatable/equatable.dart';

class Theater extends Equatable {
  const Theater({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.image,
  });

  final int id;
  final String name;
  final String address;
  final String phone;
  final String image;

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        phone,
        image,
      ];
}
