import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_up_response.dart';
import 'package:cinemix_ui/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
    required this.birthday,
    required this.password,
  });

  SignUpParams.empty()
      : fullName = '',
        email = '',
        phone = '',
        birthday = DateUtils.dateOnly(DateTime.now()),
        password = '';

  final String fullName;
  final String email;
  final String phone;
  final DateTime birthday;
  final String password;

  @override
  List<Object?> get props => [fullName, email, phone, birthday, password];
}
