import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_in_response.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_up_response.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/sign_in.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/sign_up.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultFuture<SignUpResponse> signUp(SignUpParams params);

  VoidFuture verify(String code);

  ResultFuture<SignInResponse> signIn(SignInParams params);

  VoidFuture setSignIn();

  ResultFuture<bool> isSignedIn();

  VoidFuture signOut();

  VoidFuture setSavePassword({required bool value});

  ResultFuture<bool> isSavePassword();

  VoidFuture savePassword(String password);

  ResultFuture<String> getSavedPassword();

  VoidFuture removeSavedPassword();
}
