import 'package:cinemix_ui/core/common/widgets/social_sign_in.dart';
import 'package:cinemix_ui/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:cinemix_ui/src/authentication/presentation/widgets/sign_up/otp_verify_widget.dart';
import 'package:cinemix_ui/src/authentication/presentation/widgets/sign_up/sign_up_form.dart';
import 'package:cinemix_ui/src/home/presentation/views/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  bool switchToVerify = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            setState(() {
              switchToVerify = true;
            });
          }

          if (state is AccountVerified) {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          }
        },
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: switchToVerify
                ? const OTPVerifyWidget()
                : const Column(
                    children: [
                      Expanded(child: SignUpForm()),
                      SocialSignIn(),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
