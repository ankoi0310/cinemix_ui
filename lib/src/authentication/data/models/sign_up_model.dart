import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:equatable/equatable.dart';

class SignUpRequest extends Equatable {
  const SignUpRequest({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
  });

  const SignUpRequest.empty()
      : fullName = '',
        email = '',
        phone = '',
        password = '';

  final String fullName;
  final String email;
  final String phone;
  final String password;

  SignUpRequest copyWith({
    String? fullName,
    String? email,
    String? phone,
    String? password,
  }) {
    return SignUpRequest(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  DataMap toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  @override
  List<Object?> get props => [fullName, email, phone, password];
}

class SignUpResponse {
  const SignUpResponse({
    required this.email,
  });

  factory SignUpResponse.fromMap(DataMap map) {
    return SignUpResponse(
      email: map['email'] as String,
    );
  }

  final String email;
}
