import 'package:cinemix_ui/core/common/entity/base_entity.dart';
import 'package:cinemix_ui/src/movie/domain/entities/genre.dart';
import 'package:flutter/material.dart';

class Movie extends BaseEntity {
  const Movie({
    required this.name,
    required this.description,
    required this.directors,
    required this.actors,
    required this.genres,
    required this.releasedDate,
    required this.duration,
    required this.country,
    required this.language,
    required this.localizations,
    required this.format,
    required this.rating,
    required this.posterUrl,
    required this.trailerUrl,
    required this.state,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  Movie.empty(int id)
      : this(
          id: id,
          name: 'The Shawshank Redemption',
          description: 'Two imprisoned',
          directors: 'Frank Darabont',
          actors: 'Tim Robbins, Morgan Freeman',
          genres: const [
            Genre.demo1(),
            Genre.demo2(),
            Genre.demo3(),
          ],
          releasedDate: DateUtils.dateOnly(DateTime(1994, 9, 23)),
          duration: 142,
          country: 'Mỹ',
          language: 'Tiếng Anh',
          localizations: 'Phụ đề Tiếng Việt',
          format: '2D',
          rating: 'T18',
          posterUrl: 'assets/images/movies/poster.jpg',
          trailerUrl: 'https://www.youtube.com/watch?v=6hB3S9bIaco',
          state: 'Showing',
        );

  final String name;
  final String description;
  final String directors;
  final String actors;
  final List<Genre> genres;
  final DateTime releasedDate;
  final int duration;
  final String country;
  final String language;
  final String localizations;
  final String format;
  final String rating;
  final String posterUrl;
  final String trailerUrl;
  final String state;

  @override
  List<Object?> get props => [
        ...super.props,
        name,
        description,
        directors,
        actors,
        genres,
        releasedDate,
        duration,
        country,
        language,
        localizations,
        format,
        rating,
        posterUrl,
        trailerUrl,
        state,
      ];
}
