import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinemix_ui/core/common/views/circle_loading_view.dart';
import 'package:cinemix_ui/core/shared/enums/movie_enum.dart' as movie_enum;
import 'package:cinemix_ui/src/movie/presentation/cubit/movie_cubit.dart';
import 'package:cinemix_ui/src/movie/presentation/views/movie_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShowingCarousel extends StatefulWidget {
  const ShowingCarousel({super.key});

  @override
  State<ShowingCarousel> createState() => _ShowingCarouselState();
}

class _ShowingCarouselState extends State<ShowingCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieError) {
          return const Center(
            child: Text('Không thể tải danh sách phim đang chiếu'),
          );
        }

        if (state is MovieLoading) {
          return const SizedBox(
            height: 400,
            child: CircleLoading(),
          );
        }

        final movies = (state as MovieListLoaded).showingMovies;
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                viewportFraction: .7,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                height: 400,
                initialPage: _current,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items: movies.map((movie) {
                return InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      MovieDetailScreen.routeName,
                      arguments: movie.id,
                    );
                  },
                  child: Skeletonizer(
                    enabled: state is MovieLoading,
                    child: Skeleton.leaf(
                      child: Image.network(
                        movie.posterUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              MovieDetailScreen.routeName,
                              arguments: movies[_current].id,
                            );
                          },
                          child: Text(
                            movies[_current].name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                movies[_current]
                                    .genres
                                    .map((e) => e.name)
                                    .join(', '),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              width: 40,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                movies[_current].format,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 40,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: movie_enum.MovieRating.fromValue(
                                  movies[_current].rating,
                                ).backgroundColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                movies[_current].rating,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: movie_enum.MovieRating.fromValue(
                                        movies[_current].rating,
                                      ).textColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                      child: const Text('Đặt vé'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
