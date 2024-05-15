import 'package:bloc/bloc.dart';
import 'package:cinemix_ui/src/seat/domain/usecases/seat_option/cache_selected_options.dart';
import 'package:cinemix_ui/src/seat/domain/usecases/seat_option/clear_cached_options.dart';
import 'package:cinemix_ui/src/seat/domain/usecases/seat_option/get_selected_options.dart';
import 'package:equatable/equatable.dart';

part 'seat_option_state.dart';

class SeatOptionCubit extends Cubit<SeatOptionState> {
  SeatOptionCubit(
      {required CacheSelectedOptions cacheSelectedOptions,
      required GetSelectedOptions getSelectedOptions,
      required ClearCachedOptions clearCachedOptions})
      : _cacheSelectedOptions = cacheSelectedOptions,
        _getSelectedOptions = getSelectedOptions,
        _clearCachedOptions = clearCachedOptions,
        super(const SeatOptionInitial());

  final CacheSelectedOptions _cacheSelectedOptions;
  final GetSelectedOptions _getSelectedOptions;
  final ClearCachedOptions _clearCachedOptions;

  Future<void> cacheSelectedOptions({
    required int ticketPriceId,
    required int quantity,
  }) async {
    emit(const SeatOptionLoading());
    final result = await _cacheSelectedOptions(
      OptionsParams(ticketPriceId: ticketPriceId, quantity: quantity),
    );

    result.fold(
      (l) => emit(SeatOptionError(l.message)),
      (_) => emit(const SeatOptionCached()),
    );
  }

  Future<void> getSelectedOptions() async {
    emit(const SeatOptionLoading());
    final result = await _getSelectedOptions();

    result.fold(
      (l) => emit(SeatOptionError(l.message)),
      (r) => emit(SeatOptionLoaded(r)),
    );
  }

  Future<void> clearCachedOptions() async {
    final result = await _clearCachedOptions();

    result.fold(
      (l) => emit(SeatOptionError(l.message)),
      (_) => emit(const SeatOptionCleared()),
    );
  }
}
