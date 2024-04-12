import 'package:cinemix_ui/src/home/presentation/widgets/collection_title.dart';
import 'package:cinemix_ui/src/home/presentation/widgets/movie_card.dart';
import 'package:cinemix_ui/src/movie_detail/data/models/movie.dart';
import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CollectionTitle(
          title: 'Sắp chiếu',
          onPressed: () {},
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: demoMovies.map((movie) {
              return Container(
                width: 160,
                margin: EdgeInsets.only(
                  right: demoMovies.last == movie ? 0 : 12,
                ),
                child: MovieCard(movie: movie),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
