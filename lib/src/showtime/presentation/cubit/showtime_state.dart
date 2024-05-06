part of 'showtime_cubit.dart';

sealed class ShowtimeState extends Equatable {
  const ShowtimeState();

  @override
  List<Object> get props => [];
}

final class ShowtimeInitial extends ShowtimeState {
  const ShowtimeInitial();
}

final class ShowtimeLoading extends ShowtimeState {
  const ShowtimeLoading();
}

final class ShowtimeListLoaded extends ShowtimeState {
  const ShowtimeListLoaded(this.showtimes);

  final List<Showtime> showtimes;

  Map<Theater, List<Showtime>> get showtimesByTheater => showtimes.fold(
        <Theater, List<Showtime>>{},
        (Map<Theater, List<Showtime>> acc, showtime) {
          final theater = showtime.room.theater;
          (acc[theater] ??= <Showtime>[]).add(showtime);
          return acc;
        },
      );

  @override
  List<Object> get props => [showtimes];
}

final class ShowtimeError extends ShowtimeState {
  const ShowtimeError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
