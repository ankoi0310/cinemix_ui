part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial();
}

class SigningUp extends AuthenticationState {
  const SigningUp();
}

class SignUpSuccess extends AuthenticationState {
  const SignUpSuccess({required this.signUpResponse});

  final SignUpResponse signUpResponse;
}

class SignUpError extends AuthenticationState {
  const SignUpError(this.message);

  final String message;
}

class SigningIn extends AuthenticationState {
  const SigningIn();
}

class SignInSuccess extends AuthenticationState {
  const SignInSuccess({required this.signInResponse});

  final SignInResponse signInResponse;
}

class SignInError extends AuthenticationState {
  const SignInError(this.message);

  final String message;
}
