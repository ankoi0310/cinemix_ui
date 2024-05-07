import 'package:equatable/equatable.dart';

class BaseEntity extends Equatable {
  const BaseEntity({
    this.id = 0,
    this.createdDate,
    this.modifiedDate,
  });

  final int id;
  final DateTime? createdDate;
  final DateTime? modifiedDate;

  @override
  List<Object?> get props => [id, createdDate, modifiedDate];
}
