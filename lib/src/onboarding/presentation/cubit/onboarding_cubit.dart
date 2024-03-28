import 'package:bloc/bloc.dart';
import 'package:cinemix_ui/src/onboarding/domain/usecases/cache_first_time.dart';
import 'package:cinemix_ui/src/onboarding/domain/usecases/is_first_time.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit({
    required CacheFirstTime cacheFirstTime,
    required IsFirstTime isFirstTime,
  })  : _cacheFirstTime = cacheFirstTime,
        _isFirstTime = isFirstTime,
        super(const OnboardingInitial());

  final CacheFirstTime _cacheFirstTime;
  final IsFirstTime _isFirstTime;

  Future<void> cacheFirstTime() async {
    emit(const CachingFirstTime());
    final result = await _cacheFirstTime();

    result.fold(
      (l) => emit(OnboardingError(l.message)),
      (r) => emit(const FirstTimeCached()),
    );
  }

  Future<void> checkFirstTime() async {
    emit(const CheckingFirstTime());

    final result = await _isFirstTime();

    result.fold(
      (l) => emit(const OnboardingStatus(isFirstTime: true)),
      (r) => emit(OnboardingStatus(isFirstTime: r)),
    );
  }
}
