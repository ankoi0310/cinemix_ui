import 'package:cinemix_ui/core/common/widgets/image_container.dart';
import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/core/shared/enums/image_orientation.dart';
import 'package:cinemix_ui/core/shared/utils/date_util.dart';
import 'package:cinemix_ui/src/movie/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageContainer(
          image: movie.posterUrl,
          orientation: ImageOrientation.portrait,
        ),
        const SizedBox(height: 4),
        Text(
          movie.releasedDate.format(format: 'dd/MM/yyyy'),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: KAppColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
