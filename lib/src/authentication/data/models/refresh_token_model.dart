import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:equatable/equatable.dart';

class RefreshTokenResponse extends Equatable {
  const RefreshTokenResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  factory RefreshTokenResponse.fromMap(DataMap map) {
    return RefreshTokenResponse(
      accessToken: map['accessToken'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }

  final String accessToken;
  final String refreshToken;

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
