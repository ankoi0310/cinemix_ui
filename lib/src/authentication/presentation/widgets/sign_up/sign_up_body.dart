import 'package:cinemix_ui/core/common/widgets/social_sign_in.dart';
import 'package:cinemix_ui/src/authentication/presentation/widgets/sign_up/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SignUpForm(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SocialSignIn(),
            ),
          ),
        ],
      ),
    );
  }
}
