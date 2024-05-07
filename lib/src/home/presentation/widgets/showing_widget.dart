import 'package:cinemix_ui/src/home/presentation/widgets/showing_carousel.dart';
import 'package:cinemix_ui/src/movie/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class ShowingWidget extends StatelessWidget {
  const ShowingWidget({required this.movies, super.key});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: ShowingCarousel(movies: movies),
      ),
    );
  }
}
