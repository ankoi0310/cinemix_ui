import 'package:cinemix_ui/src/movie/presentation/widgets/movie_detail_body.dart';
import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  static const String routeName = '/movie';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MovieDetailBody(),
    );
  }
}
