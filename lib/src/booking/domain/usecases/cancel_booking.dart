import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/booking/domain/repositories/booking_repository.dart';
import 'package:cinemix_ui/src/invoice/domain/entities/invoice.dart';

class CancelBooking extends UsecaseWithParams<Invoice, int> {
  CancelBooking(this._repository);

  final BookingRepository _repository;

  @override
  ResultFuture<Invoice> call(int params) async {
    return _repository.cancelBooking(params);
  }
}
