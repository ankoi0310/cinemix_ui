import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/showtime/domain/entities/showtime.dart';
import 'package:cinemix_ui/src/showtime/domain/repositories/showtime_repository.dart';

class CacheSelectedShowtime extends UsecaseWithParams<void, Showtime> {
  CacheSelectedShowtime(this._repository);

  final ShowtimeRepository _repository;

  @override
  VoidFuture call(Showtime params) async {
    return _repository.cacheSelectedShowtime(params);
  }
}
