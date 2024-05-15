import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/authentication/domain/repositories/authentication_repository.dart';

class IsSavePassword extends UsecaseWithoutParams<bool> {
  const IsSavePassword(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<bool> call() async {
    return _repository.isSavePassword();
  }
}
