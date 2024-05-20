import 'package:cinemix_ui/src/home/presentation/widgets/coming_soon_widget.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/home_header.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/movie_search_form.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/showing_widget.dart';
import 'package:cinemix_ui/src/movie/presentation/cubit/movie_cubit.dart';
import 'package:cinemix_ui/src/seat/presentation/cubit/seat/seat_cubit.dart';
import 'package:cinemix_ui/src/seat/presentation/cubit/seat_option/seat_option_cubit.dart';
import 'package:cinemix_ui/src/showtime/presentation/cubit/showtime_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MovieCubit>().searchMovie();
    context.read<ShowtimeCubit>().clearCachedShowtime();
    context.read<SeatOptionCubit>().clearCachedOptions();
    context.read<SeatCubit>().clearCachedSeats();

    return RefreshIndicator(
      onRefresh: () async {
        await context.read<MovieCubit>().searchMovie();
      },
      child: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(),
            SizedBox(height: 12),
            MovieSearchForm(),
            SizedBox(height: 24),
            ShowingWidget(),
            SizedBox(height: 24),
            ComingSoonWidget(),
          ],
        ),
      ),
    );
  }
}
