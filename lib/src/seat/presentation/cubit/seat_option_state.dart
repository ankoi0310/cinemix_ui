part of 'seat_option_cubit.dart';

sealed class SeatOptionState extends Equatable {
  const SeatOptionState();

  @override
  List<Object> get props => [];
}

final class SeatOptionInitial extends SeatOptionState {
  const SeatOptionInitial();
}

final class SeatOptionLoading extends SeatOptionState {
  const SeatOptionLoading();
}

final class SeatOptionError extends SeatOptionState {
  const SeatOptionError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class SeatOptionCached extends SeatOptionState {
  const SeatOptionCached();
}

final class SeatOptionLoaded extends SeatOptionState {
  const SeatOptionLoaded(this.selectedOptions);

  final Map<int, int> selectedOptions;

  // total quantity
  int get totalQuantity => selectedOptions.values.fold(0, (a, b) => a + b);

  @override
  List<Object> get props => [selectedOptions];
}

final class SeatOptionCleared extends SeatOptionState {
  const SeatOptionCleared();
}
