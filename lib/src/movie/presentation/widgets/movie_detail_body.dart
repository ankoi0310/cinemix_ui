import 'package:cinemix_ui/core/common/views/loading_view.dart';
import 'package:cinemix_ui/core/common/widgets/floating_back_button.dart';
import 'package:cinemix_ui/src/movie/presentation/cubit/movie_cubit.dart';
import 'package:cinemix_ui/src/movie/presentation/widgets/movie_background_image.dart';
import 'package:cinemix_ui/src/movie/presentation/widgets/movie_detail_info.dart';
import 'package:cinemix_ui/src/seat/presentation/cubit/seat_option/seat_option_cubit.dart';
import 'package:cinemix_ui/src/showtime/presentation/cubit/showtime_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailBody extends StatelessWidget {
  const MovieDetailBody({required this.id, super.key});

  final int id;

  @override
  Widget build(BuildContext context) {
    context.read<MovieCubit>().getMovieById(id);
    context.read<ShowtimeCubit>().clearCachedShowtime();
    context.read<SeatOptionCubit>().clearCachedOptions();

    return BlocConsumer<MovieCubit, MovieState>(
      listener: (context, state) {
        if (state is MovieError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is MovieError) {
          return const Center(
            child: Text('Error loading movie'),
          );
        }

        if (state is MovieLoading) {
          return const LoadingView();
        }

        final movie = (state as MovieDetailLoaded).movie;
        return Stack(
          children: [
            MovieBackgroundImage(image: movie.posterUrl),
            Positioned.fill(
              left: 16,
              right: 16,
              child: MovieDetailInfo(movie: movie),
            ),
            const FloatingBackButton(),
          ],
        );
      },
    );
  }
}