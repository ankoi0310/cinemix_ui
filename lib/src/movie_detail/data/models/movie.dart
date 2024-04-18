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

const demoMovie = Movie(
  id: 1,
  title: 'The Batman basfbasgfasfgv fafafafastgfvas',
  storyline:
      'In his second year of fighting crime, Batman uncovers corruption in '
      'Gotham City that connects to his own family while facing a serial '
      'killer known as the Riddler.',
  duration: '2h 55min',
  director: demoDirector,
  actors: demoActors,
  censorship: Censorship.C13,
  language: MovieLanguage.subtitle,
  releaseDate: '2022',
  rating: 8.7,
  reviewCount: 1234,
  poster: 'assets/images/movies/poster.jpg',
  banner: 'assets/images/movies/banner.png',
  genres: demoGenres,
  state: MovieState.nowPlaying,
);

const demoMovie1 = Movie(
  id: 2,
  title: 'The Batman',
  storyline:
      'In his second year of fighting crime, Batman uncovers corruption in '
      'Gotham City that connects to his own family while facing a serial '
      'killer known as the Riddler.',
  duration: '2h 55min',
  director: demoDirector,
  actors: demoActors,
  censorship: Censorship.C13,
  language: MovieLanguage.subtitle,
  releaseDate: '2022',
  rating: 8.7,
  reviewCount: 1234,
  poster: 'assets/images/movies/poster.jpg',
  banner: 'assets/images/movies/banner.png',
  genres: demoGenres,
  state: MovieState.nowPlaying,
);

const demoMovie2 = Movie(
  id: 3,
  title: 'The Batman',
  storyline:
      'In his second year of fighting crime, Batman uncovers corruption in '
      'Gotham City that connects to his own family while facing a serial '
      'killer known as the Riddler.',
  duration: '2h 55min',
  director: demoDirector,
  actors: demoActors,
  censorship: Censorship.C13,
  language: MovieLanguage.subtitle,
  releaseDate: '2022',
  rating: 8.7,
  reviewCount: 1234,
  poster: 'assets/images/movies/poster.jpg',
  banner: 'assets/images/movies/banner.png',
  genres: demoGenres,
  state: MovieState.nowPlaying,
);

const demoMovies = <Movie>[
  demoMovie,
  demoMovie1,
  demoMovie2,
];
