import 'package:cinemix_ui/core/common/entity/base_entity.dart';
import 'package:cinemix_ui/src/movie/domain/entities/genre.dart';

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
