import 'package:bloc/bloc.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_in_response.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_up_response.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/sign_in.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/sign_up.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/verify.dart';
import 'package:equatable/equatable.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({
    required SignUp signUp,
    required Verify verify,
    required SignIn signIn,
  })  : _signUp = signUp,
        _verify = verify,
        _signIn = signIn,
        super(const AuthenticationInitial());

  final SignUp _signUp;
  final Verify _verify;
  final SignIn _signIn;

  Future<void> signUp(SignUpParams params) async {
    emit(const SigningUp());
    final result = await _signUp(params);

    result.fold(
      (l) => emit(SignUpError(l.message)),
      (r) => emit(SignUpSuccess(signUpResponse: r)),
    );
  }

  Future<void> verify(String code) async {
    emit(const VerifyingAccount());
    final result = await _verify(code);

    result.fold(
      (l) => emit(AccountVerificationError(l.message)),
      (r) => emit(const AccountVerified()),
    );
  }

  Future<void> signIn(SignInParams params) async {
    emit(const SigningIn());
    final result = await _signIn(params);

    result.fold(
      (l) => emit(SignInError(l.message)),
      (r) => emit(SignInSuccess(signInResponse: r)),
    );
  }
}
