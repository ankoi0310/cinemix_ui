import 'package:cinemix_ui/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:cinemix_ui/src/home/presentation/views/home_screen.dart';
import 'package:cinemix_ui/src/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:cinemix_ui/src/onboarding/presentation/views/welcome_screen.dart';
import 'package:cinemix_ui/src/onboarding/presentation/widgets/splash_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const routeName = '/onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    context.read<OnboardingCubit>().checkFirstTime();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<OnboardingCubit, OnboardingState>(
          listener: (context, state) {
            if (state is OnboardingError) {
              // retry
              context.read<OnboardingCubit>().cacheFirstTime();
            }

            if (state is OnboardingStatus) {
              if (state.isFirstTime) {
                context.read<OnboardingCubit>().cacheFirstTime();
              } else {
                context.read<AuthenticationCubit>().isSignedIn();
              }
            }

            if (state is FirstTimeCached) {
              Navigator.of(context)
                  .pushReplacementNamed(WelcomeScreen.routeName);
            }
          },
        ),
        BlocListener<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) {
            if (state is SignedInStatus) {
              if (state.isSignedIn) {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              } else {
                Navigator.of(context)
                    .pushReplacementNamed(WelcomeScreen.routeName);
              }
            }
          },
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            if (state is CheckingFirstTime || state is CachingFirstTime) {
              return const SplashScreen();
            }

            return BlocBuilder<AuthenticationCubit, AuthenticationState>(
              builder: (context, state) {
                if (state is CheckingSignedIn) {
                  return const SplashScreen();
                }

                return const SizedBox();
              },
            );
          },
        ),
      ),
    );
  }
}
