import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_in_model.dart';
import 'package:cinemix_ui/src/authentication/domain/repositories/authentication_repository.dart';

class SetSignInInfo extends UsecaseWithParams<void, SignInInfo> {
  const SetSignInInfo(this._repository);

  final AuthenticationRepository _repository;

  @override
  VoidFuture call(SignInInfo params) async {
    return _repository.setSignInInfo(params);
  }
}
