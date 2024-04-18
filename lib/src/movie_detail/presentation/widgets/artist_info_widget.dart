import 'package:cinemix_ui/src/movie_detail/data/models/artist.dart';
import 'package:flutter/material.dart';

class ArtistInfoWidget extends StatelessWidget {
  const ArtistInfoWidget({
    required this.title,
    required this.artists,
    super.key,
  });

  final String title;
  final dynamic artists;

  @override
  Widget build(BuildContext context) {
    List<Artist> artistList;

    if (artists is List<Artist>) {
      artistList = artists as List<Artist>;
    } else if (artists is Artist) {
      artistList = [artists as Artist];
    } else {
      throw ArgumentError('Invalid type of artists');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 24),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: artistList
                .map(
                  (e) => Container(
                    width: 150,
                    margin: EdgeInsets.only(
                      right: artistList.last == e ? 0 : 16,
                    ),
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
                          child: Image.asset(e.avatar, fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Text(
                            e.name,
                            softWrap: true,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
