import 'package:bloc/bloc.dart';
import 'package:cinemix_ui/src/showtime/domain/entities/showtime.dart';
import 'package:cinemix_ui/src/showtime/domain/usecases/cache_selected_showtime.dart';
import 'package:cinemix_ui/src/showtime/domain/usecases/clear_selected_showtime.dart';
import 'package:cinemix_ui/src/showtime/domain/usecases/get_selected_showtime.dart';
import 'package:cinemix_ui/src/showtime/domain/usecases/search_showtime.dart';
import 'package:cinemix_ui/src/theater/domain/entities/theater.dart';
import 'package:equatable/equatable.dart';

part 'showtime_state.dart';

class ShowtimeCubit extends Cubit<ShowtimeState> {
  ShowtimeCubit({
    required SearchShowtime searchShowtime,
    required CacheSelectedShowtime cacheSelectedShowtime,
    required GetSelectedShowtime getSelectedShowtime,
    required ClearCachedShowtime clearSelectedShowtime,
  })  : _searchShowtime = searchShowtime,
        _cacheSelectedShowtime = cacheSelectedShowtime,
        _getSelectedShowtime = getSelectedShowtime,
        _clearCachedShowtime = clearSelectedShowtime,
        super(const ShowtimeInitial());

  final SearchShowtime _searchShowtime;
  final CacheSelectedShowtime _cacheSelectedShowtime;
  final GetSelectedShowtime _getSelectedShowtime;
  final ClearCachedShowtime _clearCachedShowtime;

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

  Future<void> cacheSelectedShowtime(Showtime showtime) async {
    emit(const CachingSelectedShowtime());
    final result = await _cacheSelectedShowtime(showtime);

    result.fold(
      (l) => emit(ShowtimeError(l.message)),
      (_) => emit(const CacheSelectedShowtimeSuccess()),
    );
  }

  Future<void> getSelectedShowtime() async {
    emit(const GettingSelectedShowtime());
    final result = await _getSelectedShowtime();

    result.fold(
      (l) => emit(ShowtimeError(l.message)),
      (r) => emit(GetSelectedShowtimeSuccess(r!)),
    );
  }

  Future<void> clearCachedShowtime() async {
    emit(const ClearingCachedShowtime());
    final result = await _clearCachedShowtime();

    result.fold(
      (l) => emit(ShowtimeError(l.message)),
      (_) => emit(const ClearCachedShowtimeSuccess()),
    );
  }
}
