import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/seat/domain/entities/seat.dart';

abstract class SeatRepository {
  const SeatRepository();

  VoidFuture cacheSelectedSeats(List<Seat> seats);
  VoidFuture removeSelectedSeats(List<Seat> seats);
  ResultFuture<List<Seat>> getSelectedSeats();
  VoidFuture clearCachedSeats();
}
