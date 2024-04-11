import 'package:cinemix_ui/src/movie_detail/data/models/artist.dart';
import 'package:cinemix_ui/src/movie_detail/data/models/movie.dart';
import 'package:cinemix_ui/src/movie_detail/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
      child: Column(
        children: [
          SizedBox(height: size.height * 0.2),
          MovieCard(movie: movie),
          const SizedBox(height: 32),
          Column(
            children: [
              buildMovieInfoRow(
                context,
                icon: Iconsax.tag,
                title: movie.genres.map((e) => e.name).join(', '),
              ),
              const SizedBox(height: 16),
              buildMovieInfoRow(
                context,
                icon: Iconsax.people,
                title: movie.censorship.value,
              ),
              const SizedBox(height: 16),
              buildMovieInfoRow(
                context,
                icon: Iconsax.language_square,
                title: movie.language.nameVN,
              ),
            ],
          ),
          const SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cốt truyện',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 24),
              Text.rich(
                TextSpan(
                  text: movie.storyline,
                  style: Theme.of(context).textTheme.titleSmall,
                  children: [],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          buildMovieInfoArtist(
            context,
            title: 'Đạo diễn',
            artists: movie.director,
          ),
          const SizedBox(height: 32),
          buildMovieInfoArtist(
            context,
            title: 'Diễn viên',
            artists: movie.actors,
          ),
        ],
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
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  Column buildMovieInfoArtist(
    BuildContext context, {
    required String title,
    required dynamic artists,
  }) {
    List<Artist> artistList;

    if (artists is List<Artist>) {
      artistList = artists;
    } else if (artists is Artist) {
      artistList = [artists];
    } else {
      throw ArgumentError('Invalid type of artists');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 24),
        Row(
          children: artistList
              .map(
                (e) => Container(
                  width: 150,
                  margin: const EdgeInsets.only(right: 16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(36),
                        child: Image.asset(
                          e.avatar,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          e.name,
                          softWrap: true,
                          maxLines: 2,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
