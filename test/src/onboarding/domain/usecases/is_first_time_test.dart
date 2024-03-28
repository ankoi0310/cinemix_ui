import 'package:cinemix_ui/src/onboarding/domain/repositories/onbroading_repository.dart';
import 'package:cinemix_ui/src/onboarding/domain/usecases/is_first_time.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'onboarding_repository.mock.dart';

void main() {
  late OnboardingRepository repository;
  late IsFirstTime usecase;

  setUp(() {
    repository = MockOnboardingRepository();
    usecase = IsFirstTime(repository);
  });

  test(
    'should get a response from the [MockOnboardingRepository]',
    () async {
      // arrange
      when(() => repository.isFirstTime()).thenAnswer((_) async {
        return const Right(true);
      });

      // act
      final result = await usecase();

      // assert
      expect(
        result,
        equals(const Right<dynamic, bool>(true)),
      );
      verify(() => repository.isFirstTime()).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
