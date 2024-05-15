import 'package:cinemix_ui/core/common/widgets/dots_loading_widget.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/collection_title.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/movie_card.dart';
import 'package:cinemix_ui/src/movie/presentation/cubit/movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CollectionTitle(title: 'Sắp chiếu'.toUpperCase()),
          const SizedBox(height: 12),
          BlocBuilder<MovieCubit, MovieState>(
            builder: (context, state) {
              if (state is MovieError) {
                return const Center(
                  child: Text(
                    'Không thể tải danh sách phim sắp chiếu',
                  ),
                );
              }

              if (state is MovieLoading) {
                return const DotsLoadingWidget();
              }

              final movies = (state as MovieListLoaded).comingSoonMovies;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: movies.map((movie) {
                    return Container(
                      width: 160,
                      margin: EdgeInsets.only(
                        right: movies.last == movie ? 0 : 16,
                      ),
                      child: MovieCard(movie: movie),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
