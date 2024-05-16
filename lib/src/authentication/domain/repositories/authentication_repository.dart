import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_in_model.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_up_model.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultFuture<SignUpResponse> signUp(SignUpRequest params);

  VoidFuture verify(String code);

  ResultFuture<SignInInfo> signIn(SignInRequest params);

  VoidFuture setSignInInfo(SignInInfo signInResponse);

  ResultFuture<bool> isSignedIn();

  ResultFuture<SignInInfo> getSignInInfo();

  VoidFuture signOut();

  VoidFuture setSavePassword({required bool value});

  ResultFuture<bool> isSavePassword();

  VoidFuture savePassword(String password);

  ResultFuture<String> getSavedPassword();

  VoidFuture removeSavedPassword();
}
