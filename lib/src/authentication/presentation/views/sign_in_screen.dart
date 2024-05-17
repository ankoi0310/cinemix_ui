import 'package:cinemix_ui/core/common/widgets/app_bar.dart';
import 'package:cinemix_ui/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:cinemix_ui/src/authentication/presentation/widgets/sign_in/sign_in_body.dart';
import 'package:cinemix_ui/src/home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const routeName = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: KAppBar(title: 'Đăng nhập'),
      resizeToAvoidBottomInset: false,
      body: SignInBody(),
    );
  }
}
