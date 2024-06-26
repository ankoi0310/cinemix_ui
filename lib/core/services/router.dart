import 'package:cinemix_ui/core/common/views/page_under_construction.dart';
import 'package:cinemix_ui/core/services/injection_container.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:cinemix_ui/src/authentication/presentation/views/otp_verify_screen.dart';
import 'package:cinemix_ui/src/authentication/presentation/views/sign_in_screen.dart';
import 'package:cinemix_ui/src/authentication/presentation/views/sign_up_screen.dart';
import 'package:cinemix_ui/src/authentication/presentation/views/sign_up_success_screen.dart';
import 'package:cinemix_ui/src/booking/presentation/cubit/booking_cubit.dart';
import 'package:cinemix_ui/src/booking/presentation/views/checkout_failed_screen.dart';
import 'package:cinemix_ui/src/booking/presentation/views/checkout_screen.dart';
import 'package:cinemix_ui/src/booking/presentation/views/checkout_success_screen.dart';
import 'package:cinemix_ui/src/home/presentation/views/home_screen.dart';
import 'package:cinemix_ui/src/invoice/domain/entities/invoice.dart';
import 'package:cinemix_ui/src/invoice/presentation/views/invoice_detail_screen.dart';
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
import 'package:cinemix_ui/src/user/data/models/user_profile.dart';
import 'package:cinemix_ui/src/user/presentation/cubit/user_cubit.dart';
import 'package:cinemix_ui/src/user/presentation/views/booking_history_screen.dart';
import 'package:cinemix_ui/src/user/presentation/views/profile_detail_screen.dart';
import 'package:cinemix_ui/src/user/presentation/views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnboardingScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => sl<OnboardingCubit>(),
            ),
            BlocProvider(
              create: (_) => sl<AuthenticationCubit>(),
            )
          ],
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
              create: (_) => sl<AuthenticationCubit>()..getSignInInfo(),
            ),
            BlocProvider(
              create: (_) => sl<MovieCubit>()..searchMovie(),
            ),
            BlocProvider(
              create: (_) => sl<ShowtimeCubit>()..clearCachedShowtime(),
            ),
            BlocProvider(
              create: (_) => sl<SeatOptionCubit>()..clearCachedOptions(),
            ),
            BlocProvider(
              create: (_) => sl<SeatCubit>()..clearCachedSeats(),
            ),
          ],
          child: const HomeScreen(),
        ),
        settings: settings,
      );
    // 7. The application navigates to the movie search screen with the keyword
    case MovieSearchScreen.routeName:
      final keyword = settings.arguments as String?;
      return _pageBuilder(
        pageBuilder: (context) => BlocProvider(
          // 8. The application calls the searchMovie event with the keyword
          create: (_) => sl<MovieCubit>()..searchMovie(keyword: keyword),
          child: const MovieSearchScreen(),
        ),
        settings: settings,
      );
    case MovieDetailScreen.routeName:
      final movieId = settings.arguments! as int;
      return _pageBuilder(
        pageBuilder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => sl<MovieCubit>()..getMovieById(movieId),
            ),
            BlocProvider(
              create: (_) => sl<ShowtimeCubit>(),
            ),
            BlocProvider(
              create: (_) => sl<SeatOptionCubit>(),
            ),
          ],
          child: const MovieDetailScreen(),
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
        pageBuilder: (context) => BlocProvider(
          create: (context) => sl<BookingCubit>(),
          child: CheckoutScreen(
            showtime: showtime,
            selectedSeats: selectedSeats,
            selectedOptions: selectedOptions,
          ),
        ),
        settings: settings,
      );
    case CheckoutSuccessScreen.routeName:
      // final orderCode = int.parse(settings.arguments! as String);
      return _pageBuilder(
        pageBuilder: (context) => BlocProvider(
          create: (_) => sl<BookingCubit>()..cancelBooking(1716402385),
          child: const CheckoutSuccessScreen(),
        ),
        settings: settings,
      );
    case CheckoutFailedScreen.routeName:
      // final orderCode = int.parse(settings.arguments! as String);
      return _pageBuilder(
        pageBuilder: (context) => BlocProvider(
          create: (_) => sl<BookingCubit>()..completePayment(1716402498),
          child: const CheckoutFailedScreen(),
        ),
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
    case ProfileScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => sl<AuthenticationCubit>(),
            ),
            BlocProvider(
              create: (_) => sl<UserCubit>(),
            ),
          ],
          child: const ProfileScreen(),
        ),
        settings: settings,
      );
    case ProfileDetailScreen.routeName:
      final arguments = settings.arguments! as DataMap;
      final userProfile = arguments['userProfile'] as UserProfile;
      final userCubit = arguments['userCubit'] as UserCubit;

      return _pageBuilder(
        pageBuilder: (context) => BlocProvider(
          create: (context) => userCubit,
          child: ProfileDetailScreen(userProfile: userProfile),
        ),
        settings: settings,
      );
    case BookingHistoryScreen.routeName:
      return _pageBuilder(
        pageBuilder: (context) => BlocProvider(
          create: (_) => sl<UserCubit>()..getBookingHistory(),
          child: const BookingHistoryScreen(),
        ),
        settings: settings,
      );
    case InvoiceDetailScreen.routeName:
      final invoice = settings.arguments! as Invoice;
      return _pageBuilder(
        pageBuilder: (context) => InvoiceDetailScreen(invoice: invoice),
        settings: settings,
      );
    default:
      return _pageBuilder(
        pageBuilder: (context) => BlocProvider(
          create: (_) => sl<AuthenticationCubit>(),
          child: const PageUnderConstruction(),
        ),
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
