part of 'seat_cubit.dart';

sealed class SeatState extends Equatable {
  const SeatState();

  @override
  List<Object> get props => [];
}

final class SeatInitial extends SeatState {
  const SeatInitial();
}

final class SeatCached extends SeatState {
  const SeatCached();
}

final class SeatCachingError extends SeatState {
  const SeatCachingError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class SeatRemoved extends SeatState {
  const SeatRemoved();
}

final class SeatRemovingError extends SeatState {
  const SeatRemovingError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class SeatLoaded extends SeatState {
  const SeatLoaded(this.selectedSeats);

  final List<Seat> selectedSeats;

  @override
  List<Object> get props => [selectedSeats];
}

final class SeatLoadingError extends SeatState {
  const SeatLoadingError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class CachedSeatCleared extends SeatState {
  const CachedSeatCleared();
}

final class CachedSeatClearingError extends SeatState {
  const CachedSeatClearingError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
