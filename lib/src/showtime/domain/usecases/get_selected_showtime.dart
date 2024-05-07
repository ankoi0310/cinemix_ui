import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/showtime/domain/entities/showtime.dart';
import 'package:cinemix_ui/src/showtime/domain/repositories/showtime_repository.dart';

class GetSelectedShowtime extends UsecaseWithoutParams<void> {
  GetSelectedShowtime(this._repository);

  final ShowtimeRepository _repository;

  @override
  ResultFuture<Showtime?> call() async {
    return _repository.getSelectedShowtime();
  }
}
