class SignInResponse {
  const SignInResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  const SignInResponse.empty()
      : accessToken = '',
        refreshToken = '';

  final String accessToken;
  final String refreshToken;
}
