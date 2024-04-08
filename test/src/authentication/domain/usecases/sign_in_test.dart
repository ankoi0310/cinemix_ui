import 'package:cinemix_ui/src/authentication/data/models/sign_in_response.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/sign_in.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'authentication_repository.mock.dart';

class FakeSignInParams extends Fake implements SignInParams {}

void main() {
  late MockAuthenticationRepository repository;
  late SignIn usecase;

  setUp(() {
    repository = MockAuthenticationRepository();
    usecase = SignIn(repository);
    registerFallbackValue(FakeSignInParams());
  });

  const signInParams = SignInParams(
    username: 'email',
    password: 'password',
  );

  const tSignInResponse = SignInResponse.empty();
  group(
    'SignIn',
    () {
      test(
        'should get a response from the [MockAuthenticationRepository]',
        () async {
          // arrange
          when(
            () => repository.signIn(any(that: isA<SignInParams>())),
          ).thenAnswer((_) async => const Right(tSignInResponse));

          // act
          final result = await usecase(signInParams);

          // assert
          expect(
            result,
            const Right<dynamic, SignInResponse>(tSignInResponse),
          );
          verify(
            () => repository.signIn(signInParams),
          ).called(1);

          verifyNoMoreInteractions(repository);
        },
      );
    },
  );
}
