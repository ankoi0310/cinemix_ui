import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:equatable/equatable.dart';

class SignInRequest extends Equatable {
  const SignInRequest({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  DataMap toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  @override
  List<Object?> get props => [username, password];
}

class SignInInfo {
  const SignInInfo({
    required this.welcomeName,
    required this.accessToken,
    required this.refreshToken,
  });

  factory SignInInfo.fromMap(DataMap map) {
    return SignInInfo(
      welcomeName: map['welcomeName'] as String,
      accessToken: map['accessToken'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }

  final String welcomeName;
  final String accessToken;
  final String refreshToken;

  DataMap toMap() {
    return {
      'welcomeName': welcomeName,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  SignInInfo copyWith({
    String? welcomeName,
    String? accessToken,
    String? refreshToken,
  }) {
    return SignInInfo(
      welcomeName: welcomeName ?? this.welcomeName,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
