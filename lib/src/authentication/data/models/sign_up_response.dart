import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:equatable/equatable.dart';

class SignUpResponse extends Equatable {
  const SignUpResponse({
    required this.email,
  });

  factory SignUpResponse.fromMap(DataMap map) {
    return SignUpResponse(
      email: map['email'] as String,
    );
  }

  const SignUpResponse.empty() : email = '';

  final String email;

  @override
  List<Object?> get props => [email];
}
