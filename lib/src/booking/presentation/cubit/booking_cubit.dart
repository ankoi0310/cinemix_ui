import 'package:bloc/bloc.dart';
import 'package:cinemix_ui/src/booking/data/models/booking_request.dart';
import 'package:cinemix_ui/src/booking/data/models/payos_model.dart';
import 'package:cinemix_ui/src/booking/domain/usecases/cancel_booking.dart';
import 'package:cinemix_ui/src/booking/domain/usecases/complete_payment.dart';
import 'package:cinemix_ui/src/booking/domain/usecases/create_booking.dart';
import 'package:cinemix_ui/src/invoice/domain/entities/invoice.dart';
import 'package:equatable/equatable.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit({
    required CreateBooking createBooking,
    required CancelBooking cancelBooking,
    required CompletePayment completePayment,
  })  : _createBooking = createBooking,
        _cancelBooking = cancelBooking,
        _completePayment = completePayment,
        super(const BookingInitial());

  final CreateBooking _createBooking;
  final CancelBooking _cancelBooking;
  final CompletePayment _completePayment;

  Future<void> createBooking(BookingRequest request) async {
    emit(const CreatingInvoice());
    final result = await _createBooking(request);

    result.fold(
      (l) => emit(CreateInvoiceFail(l.message)),
      (r) => emit(InvoiceCreated(r)),
    );
  }

  Future<void> cancelBooking(int code) async {
    emit(const CancellingBooking());
    final result = await _cancelBooking(code);

    result.fold(
      (l) => emit(CancelBookingFail(l.message)),
      (r) => emit(BookingCancelled(r)),
    );
  }

  Future<void> completePayment(int code) async {
    emit(const CompletingPayment());
    final result = await _completePayment(code);

    result.fold(
      (l) => emit(CompletePaymentFail(l.message)),
      (r) => emit(PaymentCompleted(r)),
    );
  }
}
