import 'package:cinemix_ui/core/common/widgets/app_bar.dart';
import 'package:cinemix_ui/core/res/media/media.dart';
import 'package:cinemix_ui/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:cinemix_ui/src/home/presentation/views/home_screen.dart';
import 'package:cinemix_ui/src/onboarding/presentation/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class PageUnderConstruction extends StatefulWidget {
  const PageUnderConstruction({super.key});

  @override
  State<PageUnderConstruction> createState() => _PageUnderConstructionState();
}

class _PageUnderConstructionState extends State<PageUnderConstruction> {
  bool _isSignedIn = false;

  @override
  Widget build(BuildContext context) {
    context.read<AuthenticationCubit>().isSignedIn();
    return SafeArea(
      child: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is SignedInStatus) {
            setState(() {
              _isSignedIn = state.isSignedIn;
            });
          }
        },
        child: Scaffold(
          appBar: KAppBar(
            onBackPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              _isSignedIn ? HomeScreen.routeName : WelcomeScreen.routeName,
              (route) => false,
            ),
          ),
          body: Container(
            constraints: const BoxConstraints.expand(),
            child: Center(
              child: Lottie.asset(KAppMedia.pageUnderConstruction),
            ),
          ),
        ),
      ),
    );
  }
}
