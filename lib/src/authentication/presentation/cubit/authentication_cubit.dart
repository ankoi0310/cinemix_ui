import 'package:bloc/bloc.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_in_model.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_up_model.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/get_saved_password.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/get_sign_in_info.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/is_save_password.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/is_signed_in.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/remove_saved_password.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/save_password.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/set_save_password.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/set_sign_in_info.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/sign_in.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/sign_out.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/sign_up.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/verify.dart';
import 'package:equatable/equatable.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({
    required SignUp signUp,
    required Verify verify,
    required SignIn signIn,
    required SetSavePassword setSavePassword,
    required IsSavePassword isSavePassword,
    required SavePassword savePassword,
    required GetSavedPassword getSavedPassword,
    required RemoveSavedPassword removeSavedPassword,
    required SetSignInInfo setSignIn,
    required IsSignedIn isSignedIn,
    required GetSignInInfo getSignInInfo,
    required SignOut signOut,
  })  : _signUp = signUp,
        _verify = verify,
        _signIn = signIn,
        _setSavePassword = setSavePassword,
        _isSavePassword = isSavePassword,
        _savePassword = savePassword,
        _getSavedPassword = getSavedPassword,
        _removeSavedPassword = removeSavedPassword,
        _setSignIn = setSignIn,
        _isSignedIn = isSignedIn,
        _getSignInInfo = getSignInInfo,
        _signOut = signOut,
        super(const AuthenticationInitial());

  final SignUp _signUp;
  final Verify _verify;
  final SignIn _signIn;
  final SetSavePassword _setSavePassword;
  final IsSavePassword _isSavePassword;
  final SavePassword _savePassword;
  final GetSavedPassword _getSavedPassword;
  final RemoveSavedPassword _removeSavedPassword;
  final SetSignInInfo _setSignIn;
  final IsSignedIn _isSignedIn;
  final GetSignInInfo _getSignInInfo;
  final SignOut _signOut;

  Future<void> signUp(SignUpRequest params) async {
    emit(const SigningUp());
    final result = await _signUp(params);

    result.fold(
      (l) => emit(SignUpFailed(l.message)),
      (r) => emit(SignUpSuccess(signUpResponse: r)),
    );
  }

  Future<void> verifyOTP(String code) async {
    emit(const VerifyingOTP());
    final result = await _verify(code);

    result.fold(
      (l) => emit(OTPVerifyFailed(l.message)),
      (r) => emit(const OTPVerified()),
    );
  }

  Future<void> signIn(SignInRequest params) async {
    emit(const SigningIn());
    final result = await _signIn(params);

    result.fold(
      (l) => emit(SignInFailed(l.message)),
      (r) {
        _setSignIn(r);
        emit(const SignInSuccess());
      },
    );
  }

  Future<void> setSavePassword({required bool value}) async {
    await _setSavePassword(value);
  }

  Future<bool> isSavePassword() async {
    final result = await _isSavePassword();

    return result.fold(
      (l) => false,
      (r) => r,
    );
  }

  Future<void> savePassword({required String password}) async {
    await _savePassword(password);
  }

  Future<String> getSavedPassword() async {
    final result = await _getSavedPassword();

    return result.fold(
      (l) => '',
      (r) => r,
    );
  }

  Future<void> removeSavedPassword() async {
    await _removeSavedPassword();
  }

  Future<void> loadingSavePassword() async {
    final isSave = await isSavePassword();
    final savedPassword = await getSavedPassword();

    emit(SavePasswordStatus(isSave: isSave, savedPassword: savedPassword));
  }

  Future<void> isSignedIn() async {
    emit(const CheckingSignedIn());

    final result = await _isSignedIn();

    return result.fold(
      (l) => emit(const SignedInStatus(isSignedIn: false)),
      (r) => emit(SignedInStatus(isSignedIn: r)),
    );
  }

  Future<void> getSignInInfo() async {
    emit(const GettingSignInInfo());
    final result = await _getSignInInfo();

    return result.fold(
      (l) => emit(GetSignInInfoFailed(l.message)),
      (r) => emit(GetSignInInfoSuccess(signInInfo: r)),
    );
  }

  Future<void> signOut() async => _signOut();
}
