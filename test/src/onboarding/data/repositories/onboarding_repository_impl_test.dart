import 'package:cinemix_ui/src/onboarding/data/datasource/onboarding_local_data_source.dart';
import 'package:cinemix_ui/src/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:cinemix_ui/src/onboarding/domain/repositories/onbroading_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOnboardingLocalDataSource extends Mock
    implements OnboardingLocalDataSource {}

void main() {
  late OnboardingLocalDataSource dataSource;
  late OnboardingRepositoryImpl repository;

  setUp(() {
    dataSource = MockOnboardingLocalDataSource();
    repository = OnboardingRepositoryImpl(dataSource);
  });

  test('should be a subclass of [OnboardingRepository]', () {
    expect(repository, isA<OnboardingRepository>());
  });

  group('cacheFirstTime', () {
    test(
      'should complete successfully when call to local source is successful',
      () async {
        // arrange
        when(() => dataSource.cacheFirstTime()).thenAnswer(
          (_) async => Future.value(),
        );

        // act
        final result = await repository.cacheFirstTime();

        // assert
        expect(result, equals(const Right<dynamic, void>(null)));
        verify(() => dataSource.cacheFirstTime());

        verifyNoMoreInteractions(dataSource);
      },
    );
  });
}
