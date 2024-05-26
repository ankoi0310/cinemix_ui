import 'package:cinemix_ui/core/common/widgets/app_bar.dart';
import 'package:cinemix_ui/src/movie/presentation/widgets/movie_search_body.dart';
import 'package:flutter/material.dart';

class MovieSearchScreen extends StatelessWidget {
  const MovieSearchScreen({super.key});

  static const String routeName = '/movie-search';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: KAppBar(title: 'Tìm kiếm phim'),
        resizeToAvoidBottomInset: false,
        body: MovieSearchBody(),
      ),
    );
  }
}
