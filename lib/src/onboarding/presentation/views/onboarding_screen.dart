import 'package:cinemix_ui/src/onboarding/presentation/cubit/onboarding_cubit.dart';
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
    return Scaffold(
      body: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingError) {
            // retry
            context.read<OnboardingCubit>().cacheFirstTime();
          }

          if (state is OnboardingStatus) {
            if (state.isFirstTime) {
              context.read<OnboardingCubit>().cacheFirstTime();
            } else {
              // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            }
          }

          if (state is FirstTimeCached) {
            /*
            TODO: Implement the logic to navigate to the next screen
                  Navigate to the welcome screen
            */
            // Navigator.of(context).pushReplacementNamed(WelcomeScreen.routeName);
          }
        },
        builder: (context, state) {
          // if (state is CheckingFirstTime || state is CachingFirstTime) {
          //   return const SplashScreen();
          // }

          return SizedBox();
        },
      ),
    );
  }
}
