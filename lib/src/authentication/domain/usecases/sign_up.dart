import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_up_response.dart';
import 'package:cinemix_ui/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class SignUp extends UsecaseWithParams<SignUpResponse, SignUpParams> {
  const SignUp(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<SignUpResponse> call(SignUpParams params) {
    return _repository.signUp(params);
  }
}

class SignUpParams extends Equatable {
  const SignUpParams({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
  });

  const SignUpParams.empty()
      : fullName = '',
        email = '',
        phone = '',
        password = '';

  final String fullName;
  final String email;
  final String phone;
  final String password;

  SignUpParams copyWith({
    String? fullName,
    String? email,
    String? phone,
    String? password,
  }) {
    return SignUpParams(
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
