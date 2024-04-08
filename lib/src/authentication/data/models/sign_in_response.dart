import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:equatable/equatable.dart';

class SignInResponse extends Equatable {
  const SignInResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  SignInResponse.fromMap(DataMap map)
      : accessToken = map['accessToken'] as String,
        refreshToken = map['refreshToken'] as String;

  const SignInResponse.empty()
      : accessToken = '',
        refreshToken = '';

  final String accessToken;
  final String refreshToken;

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
