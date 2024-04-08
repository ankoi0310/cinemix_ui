import 'dart:convert';

import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_in_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tSignInResponse = SignInResponse.empty();

  test('should be a subclass of [SignInResponse] entity', () {
    // assert
    expect(tSignInResponse, isA<SignInResponse>());
  });

  final tMap = jsonDecode(fixture('sign_in_response.json')) as DataMap;
  group('fromMap', () {
    test('should return a valid [SignInResponse] from the map', () {
      // act
      final result = SignInResponse.fromMap(tMap);
      // assert
      expect(result, isA<SignInResponse>());
      expect(result, equals(tSignInResponse));
    });

    test('should throw an [Error] when the map is invalid', () {
      // act
      SignInResponse call() => SignInResponse.fromMap(const {});
      // assert
      expect(call, throwsA(isA<Error>()));
    });
  });
}
