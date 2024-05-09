import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/seat/domain/entities/seat.dart';
import 'package:cinemix_ui/src/seat/domain/repositories/seat_repository.dart';

class CacheSelectedSeats extends UsecaseWithParams<void, List<Seat>> {
  CacheSelectedSeats(this._repository);

  final SeatRepository _repository;

  @override
  VoidFuture call(List<Seat> params) {
    return _repository.cacheSelectedSeats(params);
  }
}
