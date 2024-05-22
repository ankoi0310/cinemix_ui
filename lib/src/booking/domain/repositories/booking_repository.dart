import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/booking/data/models/booking_request.dart';
import 'package:cinemix_ui/src/booking/data/models/payos_model.dart';

abstract class BookingRepository {
  const BookingRepository();

  ResultFuture<LinkCreationResponse> createBooking(BookingRequest params);
}
