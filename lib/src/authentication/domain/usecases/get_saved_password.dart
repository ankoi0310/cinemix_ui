import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/authentication/domain/repositories/authentication_repository.dart';

class GetSavedPassword extends UsecaseWithoutParams<String> {
  const GetSavedPassword(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<String> call() {
    return _repository.getSavedPassword();
  }
}
