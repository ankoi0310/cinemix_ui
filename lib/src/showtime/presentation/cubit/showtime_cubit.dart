import 'package:bloc/bloc.dart';
import 'package:cinemix_ui/src/showtime/domain/entities/showtime.dart';
import 'package:cinemix_ui/src/showtime/domain/usecases/search_showtime.dart';
import 'package:cinemix_ui/src/theater/domain/entities/theater.dart';
import 'package:equatable/equatable.dart';

part 'showtime_state.dart';

class ShowtimeCubit extends Cubit<ShowtimeState> {
  ShowtimeCubit({
    required SearchShowtime searchShowtime,
  })  : _searchShowtime = searchShowtime,
        super(const ShowtimeInitial());

  final SearchShowtime _searchShowtime;

  Future<void> searchShowtime({
    int? movie,
    int? theater,
    String? date,
  }) async {
    emit(const ShowtimeLoading());
    final result = await _searchShowtime(
      ShowtimeSearchParams(
        movie: movie,
        theater: theater,
        date: date,
      ),
    );

    result.fold(
      (l) => emit(ShowtimeError(l.message)),
      (r) => emit(ShowtimeListLoaded(r)),
    );
  }
}
