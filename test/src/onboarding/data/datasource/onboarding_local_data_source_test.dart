import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/src/onboarding/data/datasource/onboarding_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences prefs;
  late OnboardingLocalDataSource dataSource;

  setUp(() {
    prefs = MockSharedPreferences();
    dataSource = OnboardingLocalDataSourceImpl(prefs);
  });

  group('cacheFirstTime', () {
    test(
      'should call [SharedPreferences] to cache the data',
      () async {
        when(() => prefs.setBool(any(), any())).thenAnswer((_) async => true);

        await dataSource.cacheFirstTime();

        verify(() => prefs.setBool(kFirstTimeKey, false));
        verifyNoMoreInteractions(prefs);
      },
    );

    test(
      'should throw a [CacheException] when there is an error caching the data',
      () async {
        when(() => prefs.setBool(any(), any())).thenThrow(Exception());

        final methodCall = dataSource.cacheFirstTime;

        expect(methodCall, throwsA(isA<CacheException>()));
        verify(() => prefs.setBool(kFirstTimeKey, false)).called(1);
        verifyNoMoreInteractions(prefs);
      },
    );
  });

  group('isFirstTime', () {
    test(
      'should call [SharedPreferences] to check if it is the first time '
      'and return the right response from [SharedPreferences] '
      'when data is available',
      () async {
        when(() => prefs.getBool(any())).thenReturn(false);

        final result = await dataSource.isFirstTime();

        expect(result, false);
        verify(() => prefs.getBool(kFirstTimeKey));
        verifyNoMoreInteractions(prefs);
      },
    );

    test(
      'should return true if there is no data available in [SharedPreferences]',
      () async {
        when(() => prefs.getBool(any())).thenReturn(null);

        final result = await dataSource.isFirstTime();

        expect(result, true);
        verify(() => prefs.getBool(kFirstTimeKey));
        verifyNoMoreInteractions(prefs);
      },
    );

    test(
      'should throw a [CacheException] when there is an error '
      'fetching the data',
      () async {
        when(() => prefs.getBool(any())).thenThrow(Exception());

        final methodCall = dataSource.isFirstTime;

        expect(methodCall, throwsA(isA<CacheException>()));
        verify(() => prefs.getBool(kFirstTimeKey)).called(1);
        verifyNoMoreInteractions(prefs);
      },
    );
  });
}
