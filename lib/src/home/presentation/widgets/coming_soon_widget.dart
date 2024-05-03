import 'package:cinemix_ui/src/home/presentation/widgets/collection_title.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/movie_card.dart';
import 'package:cinemix_ui/src/movie/presentation/cubit/movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComingSoonWidget extends StatefulWidget {
  const ComingSoonWidget({super.key});

  @override
  State<ComingSoonWidget> createState() => _ComingSoonWidgetState();
}

class _ComingSoonWidgetState extends State<ComingSoonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        children: [
          const CollectionTitle(title: 'Sắp chiếu'),
          const SizedBox(height: 12),
          BlocConsumer<MovieCubit, MovieState>(
            listener: (context, state) {},
            builder: (context, state) {
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
