import 'package:cinemix_ui/core/errors/failures.dart';
import 'package:cinemix_ui/src/onboarding/domain/repositories/onbroading_repository.dart';
import 'package:cinemix_ui/src/onboarding/domain/usecases/cache_first_time.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'onboarding_repository.mock.dart';

void main() {
  late OnboardingRepository repository;
  late CacheFirstTime usecase;

  setUp(() {
    repository = MockOnboardingRepository();
    usecase = CacheFirstTime(repository);
  });

  test(
    'should call the [OnboardingRepository.cacheFirstTime] '
    'and return the right data',
    () async {
      // arrange
      when(() => repository.cacheFirstTime()).thenAnswer((_) async {
        return Left(
          ServerFailure(
            message: 'Server Failure',
            statusCode: 500,
          ),
        );
      });

      // act
      final result = await usecase();

      // assert
      expect(
        result,
        equals(
          Left<Failure, dynamic>(
            ServerFailure(
              message: 'Server Failure',
              statusCode: 500,
            ),
          ),
        ),
      );
      verify(() => repository.cacheFirstTime()).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
