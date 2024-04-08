import 'dart:convert';

import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_up_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tSignUpResponse = SignUpResponse.empty();

  test('should be a subclass of [SignUpResponse] entity', () {
    // assert
    expect(tSignUpResponse, isA<SignUpResponse>());
  });

  final tMap = jsonDecode(fixture('sign_up_response.json')) as DataMap;
  group('fromMap', () {
    test('should return a valid [SignUpResponse] from the map', () {
      // act
      final result = SignUpResponse.fromMap(tMap);
      // assert
      expect(result, isA<SignUpResponse>());
      expect(result, equals(tSignUpResponse));
    });

    test('should throw an [Error] when the map is invalid', () {
      // act
      SignUpResponse call() => SignUpResponse.fromMap(const {});
      // assert
      expect(call, throwsA(isA<Error>()));
    });
  });
}
