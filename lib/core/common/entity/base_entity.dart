import 'package:equatable/equatable.dart';

class BaseEntity extends Equatable {
  const BaseEntity({
    required this.id,
    required this.createdDate,
    required this.modifiedDate,
  });

  final int id;
  final DateTime createdDate;
  final DateTime modifiedDate;

  @override
  List<Object?> get props => [
        id,
        createdDate,
        modifiedDate,
      ];
}
