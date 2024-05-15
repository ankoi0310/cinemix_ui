import 'package:cinemix_ui/src/movie/presentation/cubit/movie_cubit.dart';
import 'package:cinemix_ui/src/movie/presentation/widgets/movie_search_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieSearchScreen extends StatelessWidget {
  const MovieSearchScreen({
    this.keyword,
    super.key,
  });

  final String? keyword;

  static const String routeName = '/movie-search';

  @override
  Widget build(BuildContext context) {
    context.read<MovieCubit>().searchMovie(name: keyword);

    return const Scaffold(
      body: MovieSearchBody(),
    );
  }
}
