import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/authentication/domain/repositories/authentication_repository.dart';

class RemoveSavedPassword extends UsecaseWithoutParams<void> {
  const RemoveSavedPassword(this._repository);

  final AuthenticationRepository _repository;

  @override
  VoidFuture call() async {
    return _repository.removeSavedPassword();
  }
}
