import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/showtime/domain/repositories/showtime_repository.dart';

class ClearCachedShowtime extends UsecaseWithoutParams<void> {
  ClearCachedShowtime(this._repository);

  final ShowtimeRepository _repository;

  @override
  VoidFuture call() {
    return _repository.clearCachedShowtime();
  }
}
