import 'package:cinemix_ui/src/authentication/data/models/sign_up_response.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/sign_up.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mocktail/mocktail.dart';

import 'authentication_repository.mock.dart';

class FakeSignUpParams extends Fake implements SignUpParams {}

void main() {
  late MockAuthenticationRepository repository;
  late SignUp usecase;

  setUp(() {
    repository = MockAuthenticationRepository();
    usecase = SignUp(repository);
    registerFallbackValue(FakeSignUpParams());
  });

  final tSignUpParams = SignUpParams(
    fullName: 'fullName',
    email: 'email',
    phone: 'phone',
    birthday: DateFormat('dd-MM-yyyy').parse('01-01-2000'),
    password: 'password',
  );
  const tSignUpResponse = SignUpResponse.empty();
  test(
    'should return [SignUpResponse] from the repositories',
    () async {
      // arrange
      when(
        () => repository.signUp(any(that: isA<SignUpParams>())),
      ).thenAnswer((_) async => const Right(tSignUpResponse));

      // act
      final result = await usecase(tSignUpParams);

      // assert
      expect(result, const Right<dynamic, SignUpResponse>(tSignUpResponse));
      verify(
        () => repository.signUp(tSignUpParams),
      ).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
