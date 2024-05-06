import 'package:equatable/equatable.dart';

class BaseEntity extends Equatable {
  const BaseEntity({
    this.createdDate,
    this.modifiedDate,
    this.id,
  });

  final int? id;
  final DateTime? createdDate;
  final DateTime? modifiedDate;

  @override
  List<Object?> get props => [id, createdDate, modifiedDate];
}
