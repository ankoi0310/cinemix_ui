import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_up_model.dart';
import 'package:cinemix_ui/src/authentication/domain/repositories/authentication_repository.dart';

class SignUp extends UsecaseWithParams<SignUpResponse, SignUpRequest> {
  const SignUp(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<SignUpResponse> call(SignUpRequest params) {
    return _repository.signUp(params);
  }
}
