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
