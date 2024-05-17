import 'package:cinemix_ui/core/common/widgets/social_sign_in.dart';
import 'package:cinemix_ui/src/authentication/presentation/widgets/sign_up/sign_up_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(child: SignUpForm()),
          SocialSignIn(),
        ],
      ),
    );
  }
}
