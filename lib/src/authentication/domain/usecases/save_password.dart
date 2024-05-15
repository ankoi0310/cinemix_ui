import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/authentication/domain/repositories/authentication_repository.dart';

class SavePassword extends UsecaseWithParams<void, String> {
  const SavePassword(this._repository);

  final AuthenticationRepository _repository;

  @override
  VoidFuture call(String params) async {
    return _repository.savePassword(params);
  }
}
