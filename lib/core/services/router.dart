import 'package:cinemix_ui/core/common/views/page_under_construction.dart';
import 'package:cinemix_ui/core/services/injection_container.dart';
// import 'package:cinemix_ui/src/authentication/presentation/cubit/authentication_cubit.dart';
// import 'package:cinemix_ui/src/authentication/presentation/views/login_screen.dart';
import 'package:cinemix_ui/src/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:cinemix_ui/src/onboarding/presentation/views/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnboardingScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => BlocProvider(
          create: (_) => sl<OnboardingCubit>(),
          child: const OnboardingScreen(),
        ),
        settings: settings,
      );
    // case LoginScreen.routeName:
    //   return _pageBuilder(
    //     pageBuilder: (context) => BlocProvider(
    //       create: (_) => sl<AuthenticationCubit>(),
    //       child: const LoginScreen(),
    //     ),
    //     settings: settings,
    //   );
    default:
      return _pageBuilder(
        pageBuilder: (context) => const PageUnderConstruction(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder({
  required Widget Function(BuildContext) pageBuilder,
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, _, __) => pageBuilder(context),
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}
