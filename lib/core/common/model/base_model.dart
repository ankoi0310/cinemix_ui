import 'package:equatable/equatable.dart';

class BaseModel extends Equatable {
  const BaseModel({
    required this.id,
    required this.createdDate,
    required this.modifiedDate,
  });

  factory BaseModel.fromMap(Map<String, dynamic> map) {
    return BaseModel(
      id: map['id'] as int,
      createdDate: map['createdDate'] as DateTime,
      modifiedDate: map['modifiedDate'] as DateTime,
    );
  }

  final int id;
  final DateTime createdDate;
  final DateTime modifiedDate;

  @override
  List<Object?> get props => [id];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdDate': createdDate,
      'modifiedDate': modifiedDate,
    };
  }

  BaseModel copyWith({
    int? id,
    DateTime? createdDate,
    DateTime? modifiedDate,
  }) {
    return BaseModel(
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
    );
  }
}
