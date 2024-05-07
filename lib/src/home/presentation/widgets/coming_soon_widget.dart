import 'package:cinemix_ui/src/home/presentation/widgets/collection_title.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/movie_card.dart';
import 'package:cinemix_ui/src/movie/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({required this.movies, super.key});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CollectionTitle(title: 'Sắp chiếu'.toUpperCase()),
          const SizedBox(height: 12),
          SingleChildScrollView(
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
          ),
        ],
      ),
    );
  }
}
