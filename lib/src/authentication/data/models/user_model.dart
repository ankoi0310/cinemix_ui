import 'package:cinemix_ui/core/common/model/base_model.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';

class UserModel extends BaseModel {
  const UserModel({
    required this.fullName,
    required super.id,
    required super.createdDate,
    required super.modifiedDate,
  });

  UserModel.fromMap(DataMap map)
      : fullName = map['fullName'] as String,
        super(
          id: map['id'] as int,
          createdDate: map['createdDate'] as DateTime,
          modifiedDate: map['modifiedDate'] as DateTime,
        );

  UserModel.empty()
      : fullName = '',
        super(id: 0, createdDate: DateTime.now(), modifiedDate: DateTime.now());

  final String fullName;

  @override
  List<Object?> get props => [id, fullName, createdDate, modifiedDate];

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'createdDate': createdDate,
      'modifiedDate': modifiedDate,
    };
  }

  @override
  UserModel copyWith({
    int? id,
    String? fullName,
    DateTime? createdDate,
    DateTime? modifiedDate,
  }) {
    return UserModel(
      fullName: fullName ?? this.fullName,
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
    );
  }
}

class UserProfile {
  const UserProfile({
    required this.email,
  });

  final String email;
}
