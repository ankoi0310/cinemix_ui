import 'package:cinemix_ui/core/shared/enums/artist_type.dart';
import 'package:cinemix_ui/core/shared/enums/censorship.dart';
import 'package:cinemix_ui/core/shared/enums/language.dart';
import 'package:cinemix_ui/core/shared/enums/movie_state.dart';
import 'package:cinemix_ui/src/movie_detail/data/models/artist.dart';
import 'package:cinemix_ui/src/movie_detail/data/models/genre.dart';
import 'package:cinemix_ui/src/movie_detail/data/models/movie.dart';

const kBaseUrl = 'localhost:8080/api';
const kAccessTokenKey = 'access_token';

const demoGenres = [
  Genre(
    id: 1,
    name: 'Action',
  ),
  Genre(
    id: 2,
    name: 'Adventure',
  ),
  Genre(
    id: 3,
    name: 'Crime',
  ),
];

const demoDirector = Artist(
  id: 1,
  name: 'Matt Reeves',
  avatar: 'assets/images/directors/anthony_russo.png',
  type: ArtistType.director,
);

const demoActors = <Artist>[
  Artist(
    id: 1,
    name: 'Robert Downey Jr.',
    avatar: 'assets/images/actors/robert_downey_jr.png',
    type: ArtistType.actor,
  ),
  Artist(
    id: 2,
    name: 'Robert Downey Jr.',
    avatar: 'assets/images/actors/robert_downey_jr.png',
    type: ArtistType.actor,
  ),
  Artist(
    id: 3,
    name: 'Robert Downey Jr.',
    avatar: 'assets/images/actors/robert_downey_jr.png',
    type: ArtistType.actor,
  ),
  Artist(
    id: 4,
    name: 'Robert Downey Jr.',
    avatar: 'assets/images/actors/robert_downey_jr.png',
    type: ArtistType.actor,
  ),
];

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
