import 'package:cinemix_ui/core/common/widgets/social_sign_in.dart';
import 'package:cinemix_ui/src/authentication/presentation/widgets/sign_in/sign_in_form.dart';
import 'package:flutter/material.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SignInForm(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SocialSignIn(),
          ),
        ],
      ),
    );
  }
}
