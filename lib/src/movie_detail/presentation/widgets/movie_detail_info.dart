import 'package:cinemix_ui/src/movie_detail/domain/entities/movie.dart';
import 'package:cinemix_ui/src/movie_detail/presentation/widgets/artist_info_widget.dart';
import 'package:cinemix_ui/src/movie_detail/presentation/widgets/movie_detail_card.dart';
import 'package:cinemix_ui/src/movie_detail/presentation/widgets/schedule.dart';
import 'package:cinemix_ui/src/movie_detail/presentation/widgets/storyline_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

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
          children: [
            SizedBox(height: size.height * 0.2),
            MovieDetailCard(movie: movie),
            const SizedBox(height: 32),
            Column(
              children: [
                buildMovieInfoRow(
                  context,
                  icon: IconsaxPlusBold.tag,
                  title: movie.genres.map((e) => e.name).join(', '),
                ),
                const SizedBox(height: 16),
                buildMovieInfoRow(
                  context,
                  icon: IconsaxPlusBold.security_user,
                  title: movie.censorship.value,
                ),
                const SizedBox(height: 16),
                buildMovieInfoRow(
                  context,
                  icon: IconsaxPlusBold.clipboard,
                  title: movie.language.nameVN,
                ),
              ],
            ),
            const SizedBox(height: 32),
            StorylineWidget(storyline: movie.storyline),
            const SizedBox(height: 32),
            ArtistInfoWidget(title: 'Đạo diễn', artists: movie.director),
            const SizedBox(height: 32),
            ArtistInfoWidget(title: 'Diễn viên', artists: movie.actors),
            const SizedBox(height: 32),
            const Schedule(),
          ],
        ),
      ),
    );
  }

  Row buildMovieInfoRow(
    BuildContext context, {
    required IconData icon,
    required String title,
  }) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
