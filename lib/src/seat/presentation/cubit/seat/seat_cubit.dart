import 'package:bloc/bloc.dart';
import 'package:cinemix_ui/src/seat/domain/entities/seat.dart';
import 'package:cinemix_ui/src/seat/domain/usecases/seat/cache_selected_seats.dart';
import 'package:cinemix_ui/src/seat/domain/usecases/seat/clear_cached_seats.dart';
import 'package:cinemix_ui/src/seat/domain/usecases/seat/get_selected_seats.dart';
import 'package:cinemix_ui/src/seat/domain/usecases/seat/remove_selected_seats.dart';
import 'package:equatable/equatable.dart';

part 'seat_state.dart';

class SeatCubit extends Cubit<SeatState> {
  SeatCubit({
    required CacheSelectedSeats cacheSelectedSeats,
    required RemoveSelectedSeats removeSelectedSeats,
    required GetSelectedSeats getSelectedSeats,
    required ClearCachedSeats clearCachedSeats,
  })  : _cacheSelectedSeats = cacheSelectedSeats,
        _removeSelectedSeats = removeSelectedSeats,
        _getSelectedSeats = getSelectedSeats,
        _clearCachedSeats = clearCachedSeats,
        super(const SeatInitial());

  final CacheSelectedSeats _cacheSelectedSeats;
  final RemoveSelectedSeats _removeSelectedSeats;
  final GetSelectedSeats _getSelectedSeats;
  final ClearCachedSeats _clearCachedSeats;

  Future<void> cacheSelectedSeats({
    required List<Seat> seats,
  }) async {
    final result = await _cacheSelectedSeats(seats);

    result.fold(
      (l) => emit(SeatCachingError(l.message)),
      (_) => emit(const SeatCached()),
    );
  }

  Future<void> removeSelectedSeats({
    required List<Seat> seats,
  }) async {
    final result = await _removeSelectedSeats(seats);

    result.fold(
      (l) => emit(SeatRemovingError(l.message)),
      (_) => emit(const SeatRemoved()),
    );
  }

  Future<void> getSelectedSeats() async {
    final result = await _getSelectedSeats();

    result.fold(
      (l) => emit(SeatLoadingError(l.message)),
      (r) => emit(SeatLoaded(r)),
    );
  }

  Future<void> clearCachedSeats() async {
    final result = await _clearCachedSeats();

    result.fold(
      (l) => emit(SeatCachingError(l.message)),
      (_) => emit(const CachedSeatCleared()),
    );
  }
}
