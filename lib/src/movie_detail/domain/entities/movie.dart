import 'package:cinemix_ui/core/shared/enums/censorship.dart';
import 'package:cinemix_ui/core/shared/enums/language.dart';
import 'package:cinemix_ui/core/shared/enums/movie_state.dart';
import 'package:cinemix_ui/src/movie_detail/data/models/artist.dart';
import 'package:cinemix_ui/src/movie_detail/data/models/genre.dart';
import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  const Movie({
    required this.id,
    required this.title,
    required this.storyline,
    required this.duration,
    required this.director,
    required this.actors,
    required this.censorship,
    required this.language,
    required this.releaseDate,
    required this.rating,
    required this.reviewCount,
    required this.poster,
    required this.banner,
    required this.genres,
    required this.state,
  });

  final int id;
  final String title;
  final String storyline;
  final String duration;
  final Artist director;
  final List<Artist> actors;
  final Censorship censorship;
  final MovieLanguage language;
  final String releaseDate;
  final double rating;
  final int reviewCount;
  final String poster;
  final String banner;
  final List<Genre> genres;
  final MovieState state;

  @override
  List<Object?> get props => [
        title,
        storyline,
        duration,
        director,
        actors,
        censorship,
        language,
        releaseDate,
        rating,
        reviewCount,
        genres,
        state,
      ];
}
