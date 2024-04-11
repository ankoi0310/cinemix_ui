import 'package:cinemix_ui/core/common/widgets/floating_back_button.dart';
import 'package:cinemix_ui/src/movie_detail/data/models/movie.dart';
import 'package:cinemix_ui/src/movie_detail/presentation/widgets/movie_background_banner.dart';
import 'package:cinemix_ui/src/movie_detail/presentation/widgets/movie_detail_info.dart';
import 'package:flutter/material.dart';

class MovieDetailBody extends StatefulWidget {
  const MovieDetailBody({super.key});

  @override
  State<MovieDetailBody> createState() => _MovieDetailBodyState();
}

class _MovieDetailBodyState extends State<MovieDetailBody> {
  final movie = demoMovie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MovieBackgroundBanner(banner: movie.banner),
        Positioned.fill(
          left: 16,
          right: 16,
          child: MovieDetailInfo(movie: movie),
        ),
        const FloatingBackButton(),
      ],
    );
  }
}
