import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/booking/data/models/booking_request.dart';
import 'package:cinemix_ui/src/invoice/domain/entities/invoice.dart';

abstract class BookingRepository {
  const BookingRepository();

  ResultFuture<Invoice> createBooking(BookingRequest params);
}
