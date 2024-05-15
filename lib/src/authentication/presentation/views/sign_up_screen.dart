import 'package:cinemix_ui/core/common/widgets/app_bar.dart';
import 'package:cinemix_ui/src/authentication/presentation/widgets/sign_up/sign_up_body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const routeName = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: KAppBar(),
      resizeToAvoidBottomInset: false,
      body: SignUpBody(),
    );
  }
}
