import 'package:cinemix_ui/src/movie/domain/entities/movie.dart';
import 'package:cinemix_ui/src/movie/presentation/widgets/description.dart';
import 'package:cinemix_ui/src/movie/presentation/widgets/movie_detail_card.dart';
import 'package:cinemix_ui/src/movie/presentation/widgets/schedule.dart';
import 'package:flutter/material.dart';

class MovieDetailInfo extends StatelessWidget {
  const MovieDetailInfo({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.2),
            MovieDetailCard(movie: movie),
            const SizedBox(height: 32),
            Description(storyline: movie.description),
            const SizedBox(height: 24),
            Text(
              'Đạo diễn',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 4),
            Text(
              movie.directors,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            Text(
              'Diễn viên',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 4),
            Text(
              movie.actors,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            const Schedule(),
          ],
        ),
      ),
    );
  }
}
