import 'package:bloc/bloc.dart';
import 'package:cinemix_ui/src/booking/data/models/booking_request.dart';
import 'package:cinemix_ui/src/booking/data/models/payos_model.dart';
import 'package:cinemix_ui/src/booking/domain/usecases/create_booking.dart';
import 'package:cinemix_ui/src/invoice/domain/entities/invoice.dart';
import 'package:equatable/equatable.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit({
    required CreateBooking createBooking,
  })  : _createBooking = createBooking,
        super(const BookingInitial());

  final CreateBooking _createBooking;

  Future<void> createBooking(BookingRequest request) async {
    emit(const CreatingInvoice());
    final result = await _createBooking(request);

    result.fold(
      (l) => emit(CreateInvoiceFail(l.message)),
      (r) => emit(InvoiceCreated(r)),
    );
  }
}
