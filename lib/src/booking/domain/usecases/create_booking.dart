import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/booking/data/models/booking_request.dart';
import 'package:cinemix_ui/src/booking/domain/repositories/booking_repository.dart';
import 'package:cinemix_ui/src/invoice/domain/entities/invoice.dart';

class CreateBooking extends UsecaseWithParams<Invoice, BookingRequest> {
  CreateBooking(this._repository);

  final BookingRepository _repository;

  @override
  ResultFuture<Invoice> call(BookingRequest params) async {
    return _repository.createBooking(params);
  }
}
