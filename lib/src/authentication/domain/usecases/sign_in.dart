import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_in_model.dart';
import 'package:cinemix_ui/src/authentication/domain/repositories/authentication_repository.dart';

class SignIn extends UsecaseWithParams<SignInInfo, SignInRequest> {
  const SignIn(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<SignInInfo> call(SignInRequest params) {
    return _repository.signIn(params);
  }
}
