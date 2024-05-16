import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_in_model.dart';
import 'package:cinemix_ui/src/authentication/domain/repositories/authentication_repository.dart';

class GetSignInInfo extends UsecaseWithoutParams<SignInInfo?> {
  const GetSignInInfo(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<SignInInfo> call() async {
    return _repository.getSignInInfo();
  }
}
