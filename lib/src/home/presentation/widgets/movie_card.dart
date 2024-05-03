import 'package:cinemix_ui/core/common/widgets/image_container.dart';
import 'package:cinemix_ui/core/shared/enums/image_orientation.dart';
import 'package:cinemix_ui/src/movie/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageContainer(
          image: movie.posterUrl,
          orientation: ImageOrientation.portrait,
        ),
        const SizedBox(height: 16),
        Text(
          movie.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(IconsaxPlusLinear.video, size: 16),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                movie.genres.map((e) => e.name).join(', '),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(IconsaxPlusLinear.calendar, size: 16),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                DateFormat.yMMMd().format(movie.releasedDate),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
