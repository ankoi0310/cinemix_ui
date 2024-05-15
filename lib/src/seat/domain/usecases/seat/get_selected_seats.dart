import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/seat/domain/entities/seat.dart';
import 'package:cinemix_ui/src/seat/domain/repositories/seat_repository.dart';

class GetSelectedSeats extends UsecaseWithoutParams<List<Seat>> {
  const GetSelectedSeats(this._repository);

  final SeatRepository _repository;

  @override
  ResultFuture<List<Seat>> call() {
    return _repository.getSelectedSeats();
  }
}
