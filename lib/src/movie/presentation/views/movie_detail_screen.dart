import 'package:cinemix_ui/src/movie/presentation/widgets/movie_detail_body.dart';
import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({
    required this.movieId,
    super.key,
  });

  static const String routeName = '/movie';
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieDetailBody(id: movieId),
    );
  }
}
