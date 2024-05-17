import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  const UserProfile({
    required this.email,
    required this.phone,
    required this.fullName,
    required this.emailVerified,
    required this.phoneVerified,
    required this.role,
  });

  factory UserProfile.fromMap(DataMap map) {
    return UserProfile(
      email: map['email'] as String,
      phone: map['phone'] as String,
      fullName: map['fullName'] as String,
      emailVerified: map['emailVerified'] as bool,
      phoneVerified: map['phoneVerified'] as bool,
      role: map['role'] as String,
    );
  }

  final String email;
  final String phone;
  final String fullName;
  final bool emailVerified;
  final bool phoneVerified;
  final String role;

  @override
  List<Object?> get props => [email, phone, fullName];
}

class UserProfileRequest extends Equatable {
  const UserProfileRequest({
    required this.phone,
    required this.fullName,
  });

  final String phone;
  final String fullName;

  DataMap toMap() {
    return {
      'phone': phone,
      'fullName': fullName,
    };
  }

  @override
  List<Object?> get props => [phone, fullName];
}
