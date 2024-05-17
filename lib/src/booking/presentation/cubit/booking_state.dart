part of 'booking_cubit.dart';

sealed class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

final class BookingInitial extends BookingState {
  const BookingInitial();
}

final class BookingTicket extends BookingState {
  const BookingTicket();
}

final class BookTicketSuccess extends BookingState {
  const BookTicketSuccess(this.invoice);

  final Invoice invoice;

  @override
  List<Object> get props => [invoice];
}

final class BookTicketFailed extends BookingState {
  const BookTicketFailed(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
