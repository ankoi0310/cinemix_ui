import 'package:cinemix_ui/core/common/views/loading_view.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/coming_soon_widget.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/custom_search_bar.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/showing_widget.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/welcome_header.dart';
import 'package:cinemix_ui/src/movie/presentation/cubit/movie_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MovieCubit>().searchMovie();
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieError) {
          return const Center(
            child: Text('Không thể tải danh sách phim đang chiếu'),
          );
        }

        if (state is MovieLoading) {
          return const LoadingView();
        }

        final showingMovies = (state as MovieListLoaded).showingMovies;
        final comingSoonMovies = state.comingSoonMovies;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomeHeader(),
              const SizedBox(height: 12),
              const CustomSearchBar(),
              const SizedBox(height: 24),
              ShowingWidget(movies: showingMovies),
              const SizedBox(height: 24),
              ComingSoonWidget(movies: comingSoonMovies),
            ],
          ),
        );
      },
    );
  }
}
