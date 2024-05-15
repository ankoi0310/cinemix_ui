import 'package:cinemix_ui/core/shared/utils/typedefs.dart';

class SignUpResponse {
  const SignUpResponse({
    required this.email,
  });

  factory SignUpResponse.fromMap(DataMap map) {
    return SignUpResponse(
      email: map['email'] as String,
    );
  }

  final String email;
}
