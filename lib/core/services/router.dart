import 'package:cinemix_ui/core/common/views/page_under_construction.dart';
import 'package:cinemix_ui/core/services/injection_container.dart';
import 'package:cinemix_ui/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:cinemix_ui/src/authentication/presentation/views/sign_in_screen.dart';
import 'package:cinemix_ui/src/authentication/presentation/views/sign_up_screen.dart';
import 'package:cinemix_ui/src/authentication/presentation/views/welcome_screen.dart';
import 'package:cinemix_ui/src/checkout/presentation/views/checkout_screen.dart';
import 'package:cinemix_ui/src/home/presentation/views/home_screen.dart';
import 'package:cinemix_ui/src/movie_detail/presentation/views/movie_detail_screen.dart';
import 'package:cinemix_ui/src/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:cinemix_ui/src/onboarding/presentation/views/onboarding_screen.dart';
import 'package:cinemix_ui/src/room/presentation/views/seat_selection_screen.dart';
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
    case WelcomeScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => const WelcomeScreen(),
        settings: settings,
      );
    case SignUpScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => BlocProvider(
          create: (_) => sl<AuthenticationCubit>(),
          child: const SignUpScreen(),
        ),
        settings: settings,
      );
    case SignInScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => BlocProvider(
          create: (_) => sl<AuthenticationCubit>(),
          child: const SignInScreen(),
        ),
        settings: settings,
      );
    case HomeScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => const HomeScreen(),
        settings: settings,
      );
    case MovieDetailScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => const MovieDetailScreen(movieId: 1),
        settings: settings,
      );
    case SeatSelectionScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => const SeatSelectionScreen(),
        settings: settings,
      );
    case CheckoutScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => const CheckoutScreen(),
        settings: settings,
      );
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
