import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/authentication/domain/repositories/authentication_repository.dart';

class SetSavePassword extends UsecaseWithParams<void, bool> {
  const SetSavePassword(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<void> call(bool params) async {
    return _repository.setSavePassword(value: params);
  }
}
