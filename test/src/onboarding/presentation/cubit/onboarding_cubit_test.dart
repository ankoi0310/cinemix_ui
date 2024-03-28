import 'package:bloc_test/bloc_test.dart';
import 'package:cinemix_ui/core/errors/failures.dart';
import 'package:cinemix_ui/src/onboarding/domain/usecases/cache_first_time.dart';
import 'package:cinemix_ui/src/onboarding/domain/usecases/is_first_time.dart';
import 'package:cinemix_ui/src/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCacheFirstTime extends Mock implements CacheFirstTime {}

class MockIsFirstTime extends Mock implements IsFirstTime {}

void main() {
  late CacheFirstTime cacheFirstTime;
  late IsFirstTime isFirstTime;
  late OnboardingCubit cubit;

  setUp(() {
    cacheFirstTime = MockCacheFirstTime();
    isFirstTime = MockIsFirstTime();
    cubit = OnboardingCubit(
      cacheFirstTime: cacheFirstTime,
      isFirstTime: isFirstTime,
    );
  });

  test(
    'initial state should be [OnboardingInitial]',
    () {
      expect(cubit.state, const OnboardingInitial());
    },
  );

  final tFailure = CacheFailure(
    message: 'Insufficient permissions',
    statusCode: 403,
  );

  group('cacheFirstTime', () {
    blocTest<OnboardingCubit, OnboardingState>(
      'should emit [CachingFirstTime, FirstTimeCached] when successful',
      build: () {
        when(() => cacheFirstTime()).thenAnswer((_) async => const Right(null));
        return cubit;
      },
      act: (cubit) => cubit.cacheFirstTime(),
      expect: () => const [
        CachingFirstTime(),
        FirstTimeCached(),
      ],
      verify: (_) {
        verify(() => cacheFirstTime()).called(1);
        verifyNoMoreInteractions(cacheFirstTime);
      },
    );

    blocTest<OnboardingCubit, OnboardingState>(
      'should emit [CachingFirstTime, OnboardingError] when unsuccessful',
      build: () {
        when(() => cacheFirstTime()).thenAnswer((_) async {
          return Left(tFailure);
        });
        return cubit;
      },
      act: (cubit) => cubit.cacheFirstTime(),
      expect: () => [
        const CachingFirstTime(),
        OnboardingError(tFailure.message),
      ],
      verify: (_) {
        verify(() => cacheFirstTime()).called(1);
        verifyNoMoreInteractions(cacheFirstTime);
      },
    );
  });

  group('checkFirstTime', () {
    blocTest<OnboardingCubit, OnboardingState>(
      'should emit [CheckingFirstTime, OnboardingStatus] when successful',
      build: () {
        when(() => isFirstTime()).thenAnswer((_) async => const Right(false));
        return cubit;
      },
      act: (cubit) => cubit.checkFirstTime(),
      expect: () => const [
        CheckingFirstTime(),
        OnboardingStatus(isFirstTime: false),
      ],
      verify: (_) {
        verify(() => isFirstTime()).called(1);
        verifyNoMoreInteractions(isFirstTime);
      },
    );

    blocTest<OnboardingCubit, OnboardingState>(
      'should emit [CheckingFirstTime, OnboardingStatus] when unsuccessful',
      build: () {
        when(() => isFirstTime()).thenAnswer((_) async => Left(tFailure));
        return cubit;
      },
      act: (cubit) => cubit.checkFirstTime(),
      expect: () => [
        const CheckingFirstTime(),
        const OnboardingStatus(isFirstTime: true),
      ],
      verify: (_) {
        verify(() => isFirstTime()).called(1);
        verifyNoMoreInteractions(isFirstTime);
      },
    );
  });
}
