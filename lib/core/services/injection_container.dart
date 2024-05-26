import 'package:cinemix_ui/core/handler/domain/http_request_filter.dart';
import 'package:cinemix_ui/src/authentication/data/data_sources/authentication_local_data_source.dart';
import 'package:cinemix_ui/src/authentication/data/data_sources/authentication_remote_data_source.dart';
import 'package:cinemix_ui/src/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:cinemix_ui/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/get_saved_password.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/get_sign_in_info.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/is_save_password.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/is_signed_in.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/remove_saved_password.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/save_password.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/set_save_password.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/set_sign_in_info.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/sign_in.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/sign_out.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/sign_up.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/verify.dart';
import 'package:cinemix_ui/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:cinemix_ui/src/booking/data/datasource/booking_remote_data_source.dart';
import 'package:cinemix_ui/src/booking/data/repositories/booking_repository_impl.dart';
import 'package:cinemix_ui/src/booking/domain/repositories/booking_repository.dart';
import 'package:cinemix_ui/src/booking/domain/usecases/cancel_booking.dart';
import 'package:cinemix_ui/src/booking/domain/usecases/complete_payment.dart';
import 'package:cinemix_ui/src/booking/domain/usecases/create_booking.dart';
import 'package:cinemix_ui/src/booking/presentation/cubit/booking_cubit.dart';
import 'package:cinemix_ui/src/movie/data/datasource/movie_remote_data_source.dart';
import 'package:cinemix_ui/src/movie/data/repositories/movie_repository_impl.dart';
import 'package:cinemix_ui/src/movie/domain/repositories/movie_repository.dart';
import 'package:cinemix_ui/src/movie/domain/usecases/get_movie_by_id.dart';
import 'package:cinemix_ui/src/movie/domain/usecases/search_movie.dart';
import 'package:cinemix_ui/src/movie/presentation/cubit/movie_cubit.dart';
import 'package:cinemix_ui/src/onboarding/data/datasource/onboarding_local_data_source.dart';
import 'package:cinemix_ui/src/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:cinemix_ui/src/onboarding/domain/repositories/onbroading_repository.dart';
import 'package:cinemix_ui/src/onboarding/domain/usecases/cache_first_time.dart';
import 'package:cinemix_ui/src/onboarding/domain/usecases/is_first_time.dart';
import 'package:cinemix_ui/src/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:cinemix_ui/src/seat/data/datasource/seat_local_data_source.dart';
import 'package:cinemix_ui/src/seat/data/datasource/ticket_price_local_data_source.dart';
import 'package:cinemix_ui/src/seat/data/repositories/seat_repository_impl.dart';
import 'package:cinemix_ui/src/seat/data/repositories/ticket_price_repository_impl.dart';
import 'package:cinemix_ui/src/seat/domain/repositories/seat_repository.dart';
import 'package:cinemix_ui/src/seat/domain/repositories/ticket_price_repository.dart';
import 'package:cinemix_ui/src/seat/domain/usecases/seat/cache_selected_seats.dart';
import 'package:cinemix_ui/src/seat/domain/usecases/seat/clear_cached_seats.dart';
import 'package:cinemix_ui/src/seat/domain/usecases/seat/get_selected_seats.dart';
import 'package:cinemix_ui/src/seat/domain/usecases/seat/remove_selected_seats.dart';
import 'package:cinemix_ui/src/seat/domain/usecases/seat_option/cache_selected_options.dart';
import 'package:cinemix_ui/src/seat/domain/usecases/seat_option/clear_cached_options.dart';
import 'package:cinemix_ui/src/seat/domain/usecases/seat_option/get_selected_options.dart';
import 'package:cinemix_ui/src/seat/presentation/cubit/seat/seat_cubit.dart';
import 'package:cinemix_ui/src/seat/presentation/cubit/seat_option/seat_option_cubit.dart';
import 'package:cinemix_ui/src/showtime/data/datasource/showtime_local_data_source.dart';
import 'package:cinemix_ui/src/showtime/data/datasource/showtime_remote_data_source.dart';
import 'package:cinemix_ui/src/showtime/data/repositories/showtime_repository_impl.dart';
import 'package:cinemix_ui/src/showtime/domain/repositories/showtime_repository.dart';
import 'package:cinemix_ui/src/showtime/domain/usecases/cache_selected_showtime.dart';
import 'package:cinemix_ui/src/showtime/domain/usecases/clear_selected_showtime.dart';
import 'package:cinemix_ui/src/showtime/domain/usecases/get_selected_showtime.dart';
import 'package:cinemix_ui/src/showtime/domain/usecases/search_showtime.dart';
import 'package:cinemix_ui/src/showtime/presentation/cubit/showtime_cubit.dart';
import 'package:cinemix_ui/src/user/data/datasource/user_remote_data_source.dart';
import 'package:cinemix_ui/src/user/data/repositories/user_repository_impl.dart';
import 'package:cinemix_ui/src/user/domain/repositories/user_repository.dart';
import 'package:cinemix_ui/src/user/domain/usecases/get_booking_history.dart';
import 'package:cinemix_ui/src/user/domain/usecases/get_user_profile.dart';
import 'package:cinemix_ui/src/user/domain/usecases/update_user_profile.dart';
import 'package:cinemix_ui/src/user/presentation/cubit/user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final prefs = await SharedPreferences.getInstance();

  sl
    // Business Logic
    ..registerFactory(
      () => OnboardingCubit(
        cacheFirstTime: sl(),
        isFirstTime: sl(),
      ),
    )
    ..registerFactory(
      () => AuthenticationCubit(
        signUp: sl(),
        verify: sl(),
        signIn: sl(),
        getSavedPassword: sl(),
        removeSavedPassword: sl(),
        setSavePassword: sl(),
        isSavePassword: sl(),
        savePassword: sl(),
        setSignIn: sl(),
        isSignedIn: sl(),
        getSignInInfo: sl(),
        signOut: sl(),
      ),
    )
    ..registerFactory(
      () => MovieCubit(
        getMovieById: sl(),
        searchMovie: sl(),
      ),
    )
    ..registerFactory(
      () => ShowtimeCubit(
        searchShowtime: sl(),
        cacheSelectedShowtime: sl(),
        getSelectedShowtime: sl(),
        clearSelectedShowtime: sl(),
      ),
    )
    ..registerFactory(
      () => SeatOptionCubit(
        cacheSelectedOptions: sl(),
        getSelectedOptions: sl(),
        clearCachedOptions: sl(),
      ),
    )
    ..registerFactory(
      () => SeatCubit(
        cacheSelectedSeats: sl(),
        removeSelectedSeats: sl(),
        getSelectedSeats: sl(),
        clearCachedSeats: sl(),
      ),
    )
    ..registerFactory(
      () => UserCubit(
        getUserProfile: sl(),
        updateUserProfile: sl(),
        getBookingHistory: sl(),
      ),
    )
    ..registerFactory(
      () => BookingCubit(
        createBooking: sl(),
        cancelBooking: sl(),
        completePayment: sl(),
      ),
    )

    // Use cases
    ..registerLazySingleton(() => CacheFirstTime(sl()))
    ..registerLazySingleton(() => IsFirstTime(sl()))
    ..registerLazySingleton(() => SignUp(sl()))
    ..registerLazySingleton(() => Verify(sl()))
    ..registerLazySingleton(() => SignIn(sl()))
    ..registerLazySingleton(() => SetSignInInfo(sl()))
    ..registerLazySingleton(() => IsSignedIn(sl()))
    ..registerLazySingleton(() => GetSignInInfo(sl()))
    ..registerLazySingleton(() => SignOut(sl()))
    ..registerLazySingleton(() => SetSavePassword(sl()))
    ..registerLazySingleton(() => IsSavePassword(sl()))
    ..registerLazySingleton(() => SavePassword(sl()))
    ..registerLazySingleton(() => GetSavedPassword(sl()))
    ..registerLazySingleton(() => RemoveSavedPassword(sl()))
    ..registerLazySingleton(() => GetMovieById(sl()))
    ..registerLazySingleton(() => SearchMovie(sl()))
    ..registerLazySingleton(() => SearchShowtime(sl()))
    ..registerLazySingleton(() => CacheSelectedShowtime(sl()))
    ..registerLazySingleton(() => GetSelectedShowtime(sl()))
    ..registerLazySingleton(() => ClearCachedShowtime(sl()))
    ..registerLazySingleton(() => CacheSelectedOptions(sl()))
    ..registerLazySingleton(() => GetSelectedOptions(sl()))
    ..registerLazySingleton(() => ClearCachedOptions(sl()))
    ..registerLazySingleton(() => CacheSelectedSeats(sl()))
    ..registerLazySingleton(() => RemoveSelectedSeats(sl()))
    ..registerLazySingleton(() => GetSelectedSeats(sl()))
    ..registerLazySingleton(() => ClearCachedSeats(sl()))
    ..registerLazySingleton(() => GetUserProfile(sl()))
    ..registerLazySingleton(() => UpdateUserProfile(sl()))
    ..registerLazySingleton(() => GetBookingHistory(sl()))
    ..registerLazySingleton(() => CreateBooking(sl()))
    ..registerLazySingleton(() => CancelBooking(sl()))
    ..registerLazySingleton(() => CompletePayment(sl()))

    // Repository
    ..registerLazySingleton<OnboardingRepository>(
      () => OnboardingRepositoryImpl(sl()),
    )
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(sl(), sl()),
    )
    ..registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(sl()),
    )
    ..registerLazySingleton<ShowtimeRepository>(
      () => ShowtimeRepositoryImpl(sl(), sl()),
    )
    ..registerLazySingleton<TicketPriceRepository>(
      () => TicketPriceRepositoryImpl(sl()),
    )
    ..registerLazySingleton<SeatRepository>(
      () => SeatRepositoryImpl(sl()),
    )
    ..registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(sl()),
    )
    ..registerLazySingleton<BookingRepository>(
      () => BookingRepositoryImpl(sl()),
    )

    // Data sources
    ..registerLazySingleton<OnboardingLocalDataSource>(
      () => OnboardingLocalDataSourceImpl(sl()),
    )
    ..registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(
        client: sl(),
        localDataSource: sl(),
      ),
    )
    ..registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl(sl()),
    )
    ..registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(filter: sl()),
    )
    ..registerLazySingleton<ShowtimeRemoteDataSource>(
      () => ShowtimeRemoteDataSourceImpl(filter: sl()),
    )
    ..registerLazySingleton<ShowtimeLocalDataSource>(
      () => ShowtimeLocalDataSourceImpl(sl()),
    )
    ..registerLazySingleton<TicketPriceLocalDataSource>(
      () => TicketPriceLocalDataSourceImpl(sl()),
    )
    ..registerLazySingleton<SeatLocalDataSource>(
      () => SeatLocalDataSourceImpl(sl()),
    )
    ..registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(
        localDataSource: sl(),
        filter: sl(),
      ),
    )
    ..registerLazySingleton<BookingRemoteDataSource>(
      () => BookingRemoteDataSourceImpl(
        localDataSource: sl(),
        filter: sl(),
      ),
    )

    // External
    ..registerLazySingleton<GlobalKey<NavigatorState>>(
      GlobalKey<NavigatorState>.new,
    )
    ..registerLazySingleton<SharedPreferences>(() => prefs)
    ..registerLazySingleton(http.Client.new)
    ..registerLazySingleton(
      () => HttpRequestFilter(
        client: sl(),
        remoteDataSource: sl(),
      ),
    );
}
