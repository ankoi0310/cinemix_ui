import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/authentication/domain/repositories/authentication_repository.dart';

class Verify extends UsecaseWithParams<void, String> {
  const Verify(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<void> call(String params) async {
    return _repository.verify(params);
  }
}
