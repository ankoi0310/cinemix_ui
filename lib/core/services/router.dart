import 'package:cinemix_ui/core/common/views/page_under_construction.dart';
import 'package:cinemix_ui/core/services/injection_container.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:cinemix_ui/src/authentication/presentation/views/otp_verify_screen.dart';
import 'package:cinemix_ui/src/authentication/presentation/views/sign_in_screen.dart';
import 'package:cinemix_ui/src/authentication/presentation/views/sign_up_screen.dart';
import 'package:cinemix_ui/src/authentication/presentation/views/sign_up_success_screen.dart';
import 'package:cinemix_ui/src/checkout/presentation/views/checkout_screen.dart';
import 'package:cinemix_ui/src/checkout/presentation/views/failed_payment_screen.dart';
import 'package:cinemix_ui/src/checkout/presentation/views/successful_payment_screen.dart';
import 'package:cinemix_ui/src/home/presentation/views/home_screen.dart';
import 'package:cinemix_ui/src/movie/presentation/cubit/movie_cubit.dart';
import 'package:cinemix_ui/src/movie/presentation/views/movie_detail_screen.dart';
import 'package:cinemix_ui/src/movie/presentation/views/movie_search_screen.dart';
import 'package:cinemix_ui/src/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:cinemix_ui/src/onboarding/presentation/views/onboarding_screen.dart';
import 'package:cinemix_ui/src/onboarding/presentation/views/welcome_screen.dart';
import 'package:cinemix_ui/src/seat/domain/entities/seat.dart';
import 'package:cinemix_ui/src/seat/presentation/cubit/seat/seat_cubit.dart';
import 'package:cinemix_ui/src/seat/presentation/cubit/seat_option/seat_option_cubit.dart';
import 'package:cinemix_ui/src/seat/presentation/views/seat_option_screen.dart';
import 'package:cinemix_ui/src/seat/presentation/views/seat_selection_screen.dart';
import 'package:cinemix_ui/src/showtime/domain/entities/showtime.dart';
import 'package:cinemix_ui/src/showtime/presentation/cubit/showtime_cubit.dart';
import 'package:cinemix_ui/src/ticket/presentation/views/ticket_detail_screen.dart';
import 'package:cinemix_ui/src/ticket/presentation/views/ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('Route: ${settings.name}');
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
    case OTPVerifyScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => BlocProvider(
          create: (_) => sl<AuthenticationCubit>(),
          child: OTPVerifyScreen(
            navigatorScreen: settings.arguments! as String,
          ),
        ),
        settings: settings,
      );
    case SignUpSuccessScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => const SignUpSuccessScreen(),
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
        pageBuilder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => sl<MovieCubit>(),
            ),
            BlocProvider(
              create: (_) => sl<ShowtimeCubit>(),
            ),
            BlocProvider(
              create: (_) => sl<SeatOptionCubit>(),
            ),
            BlocProvider(
              create: (_) => sl<SeatCubit>(),
            ),
          ],
          child: const HomeScreen(),
        ),
        settings: settings,
      );
    case MovieSearchScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => sl<MovieCubit>(),
            ),
          ],
          child: MovieSearchScreen(keyword: settings.arguments as String?),
        ),
        settings: settings,
      );
    case MovieDetailScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => sl<MovieCubit>(),
            ),
            BlocProvider(
              create: (_) => sl<ShowtimeCubit>(),
            ),
            BlocProvider(
              create: (_) => sl<SeatOptionCubit>(),
            ),
          ],
          child: MovieDetailScreen(movieId: settings.arguments! as int),
        ),
        settings: settings,
      );
    case SeatOptionScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => sl<ShowtimeCubit>(),
            ),
            BlocProvider(
              create: (_) => sl<SeatOptionCubit>(),
            ),
          ],
          child: SeatOptionScreen(showtime: settings.arguments! as Showtime),
        ),
        settings: settings,
      );
    case SeatSelectionScreen.routeName:
      final arguments = settings.arguments! as DataMap;
      final showtime = arguments['showtime'] as Showtime;
      final selectedOptions = arguments['selectedOptions'] as Map<int, int>;
      return _pageBuilder(
        pageBuilder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => sl<ShowtimeCubit>(),
            ),
            BlocProvider(
              create: (_) => sl<SeatOptionCubit>(),
            ),
            BlocProvider(
              create: (_) => sl<SeatCubit>(),
            ),
          ],
          child: SeatSelectionScreen(
            showtime: showtime,
            selectedOptions: selectedOptions,
          ),
        ),
        settings: settings,
      );
    case CheckoutScreen.routeName:
      final arguments = settings.arguments! as DataMap;
      final showtime = arguments['showtime'] as Showtime;
      final selectedSeats = arguments['selectedSeats'] as List<Seat>;
      final selectedOptions = arguments['selectedOptions'] as Map<int, int>;
      return _pageBuilder(
        pageBuilder: (context) => CheckoutScreen(
          showtime: showtime,
          selectedSeats: selectedSeats,
          selectedOptions: selectedOptions,
        ),
        settings: settings,
      );
    case SuccessfulPaymentScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => const SuccessfulPaymentScreen(),
        settings: settings,
      );
    case FailedPaymentScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => const FailedPaymentScreen(),
        settings: settings,
      );
    case TicketScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => const TicketScreen(),
        settings: settings,
      );
    case TicketDetailScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => const TicketDetailScreen(),
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
