part of 'booking_cubit.dart';

sealed class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

final class BookingInitial extends BookingState {
  const BookingInitial();
}

final class CreatingInvoice extends BookingState {
  const CreatingInvoice();
}

final class InvoiceCreated extends BookingState {
  const InvoiceCreated(this.linkCreationResponse);

  final LinkCreationResponse linkCreationResponse;

  @override
  List<Object> get props => [linkCreationResponse];
}

final class CreateInvoiceFail extends BookingState {
  const CreateInvoiceFail(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class CancellingBooking extends BookingState {
  const CancellingBooking();
}

final class BookingCancelled extends BookingState {
  const BookingCancelled(this.invoice);

  final Invoice invoice;

  @override
  List<Object> get props => [invoice];
}

final class CancelBookingFail extends BookingState {
  const CancelBookingFail(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class CompletingPayment extends BookingState {
  const CompletingPayment();
}

final class PaymentCompleted extends BookingState {
  const PaymentCompleted(this.invoice);

  final Invoice invoice;

  @override
  List<Object> get props => [invoice];
}

final class CompletePaymentFail extends BookingState {
  const CompletePaymentFail(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
