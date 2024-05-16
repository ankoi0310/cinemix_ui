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

class SignUpFailed extends AuthenticationState {
  const SignUpFailed(this.message);

  final String message;
}

class VerifyingOTP extends AuthenticationState {
  const VerifyingOTP();
}

class OTPVerified extends AuthenticationState {
  const OTPVerified();
}

class OTPVerifyFailed extends AuthenticationState {
  const OTPVerifyFailed(this.message);

  final String message;
}

class SigningIn extends AuthenticationState {
  const SigningIn();
}

class SignInSuccess extends AuthenticationState {
  const SignInSuccess();
}

class SignInFailed extends AuthenticationState {
  const SignInFailed(this.message);

  final String message;
}

class GettingSignInInfo extends AuthenticationState {
  const GettingSignInInfo();
}

class GetSignInInfoSuccess extends AuthenticationState {
  const GetSignInInfoSuccess({required this.signInInfo});

  final SignInInfo signInInfo;
}

class GetSignInInfoFailed extends AuthenticationState {
  const GetSignInInfoFailed(this.message);

  final String message;
}

class SavePasswordStatus extends AuthenticationState {
  const SavePasswordStatus({
    required this.isSave,
    required this.savedPassword,
  });

  final bool isSave;
  final String savedPassword;
}
