import 'package:cinemix_ui/core/common/views/loading_view.dart';
import 'package:cinemix_ui/src/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
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
    context.read<OnboardingCubit>().checkFirstTime();
  }

  @override
  Widget build(BuildContext context) {
    context.read<OnboardingCubit>();
    return Scaffold(
      body: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingStatus) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state is FirstTimeCached) {
            /*
            TODO: Implement the logic to navigate to the next screen
            */
          }
        },
        builder: (context, state) {
          if (state is CheckingFirstTime || state is CachingFirstTime) {
            return const LoadingView();
          }

          return const SizedBox();
        },
      ),
    );
  }
}
