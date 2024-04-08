import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_in_response.dart';
import 'package:cinemix_ui/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class SignIn extends UsecaseWithParams<SignInResponse, SignInParams> {
  const SignIn(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<SignInResponse> call(SignInParams params) {
    return _repository.signIn(params);
  }
}

class SignInParams extends Equatable {
  const SignInParams({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
