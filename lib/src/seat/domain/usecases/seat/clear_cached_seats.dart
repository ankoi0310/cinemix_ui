import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/seat/domain/repositories/seat_repository.dart';

class ClearCachedSeats extends UsecaseWithoutParams<void> {
  ClearCachedSeats(this.repository);

  final SeatRepository repository;

  @override
  VoidFuture call() {
    return repository.clearCachedSeats();
  }
}
