import 'dart:math';

import 'package:cinemix_ui/core/shared/enums/artist_type.dart';
import 'package:cinemix_ui/core/shared/enums/censorship.dart';
import 'package:cinemix_ui/core/shared/enums/language.dart';
import 'package:cinemix_ui/core/shared/enums/movie_state.dart';
import 'package:cinemix_ui/src/movie_detail/domain/entities/artist.dart';
import 'package:cinemix_ui/src/movie_detail/domain/entities/genre.dart';
import 'package:cinemix_ui/src/movie_detail/domain/entities/movie.dart';
import 'package:cinemix_ui/src/movie_detail/domain/entities/showtime.dart';
import 'package:cinemix_ui/src/room/domain/entities/room.dart';
import 'package:cinemix_ui/src/room/domain/entities/seat.dart';

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

final demoActors = <Artist>[
  const Artist(
    id: 1,
    name: 'Robert Downey Jr.',
    avatar: 'assets/images/actors/robert_downey_jr.png',
    type: ArtistType.actor,
  ),
  const Artist(
    id: 2,
    name: 'Robert Downey Jr.',
    avatar: 'assets/images/actors/robert_downey_jr.png',
    type: ArtistType.actor,
  ),
  const Artist(
    id: 3,
    name: 'Robert Downey Jr.',
    avatar: 'assets/images/actors/robert_downey_jr.png',
    type: ArtistType.actor,
  ),
  const Artist(
    id: 4,
    name: 'Robert Downey Jr.',
    avatar: 'assets/images/actors/robert_downey_jr.png',
    type: ArtistType.actor,
  ),
];

final demoMovie = Movie(
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

final demoMovie1 = Movie(
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

final demoMovie2 = Movie(
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

final demoMovies = <Movie>[
  demoMovie,
  demoMovie1,
  demoMovie2,
];

final now = DateTime.now();
final demoSeats = [
  List.generate(10, (j) {
    final name = 'A${j + 1}';
    return Seat(
      id: Random().nextInt(1000),
      createdDate: now,
      modifiedDate: now,
      name: name,
      columnIndex: j,
      rowIndex: 0,
    );
  }),
  List.generate(10, (j) {
    final name = 'B${j + 1}';
    return Seat(
      id: Random().nextInt(1000),
      createdDate: now,
      modifiedDate: now,
      name: name,
      columnIndex: j,
      rowIndex: 1,
    );
  }),
  List.generate(10, (j) {
    final name = 'C${j + 1}';
    return Seat(
      id: Random().nextInt(1000),
      createdDate: now,
      modifiedDate: now,
      name: name,
      columnIndex: j,
      rowIndex: 2,
    );
  }),
  List.generate(10, (j) {
    final name = 'D${j + 1}';
    return Seat(
      id: Random().nextInt(1000),
      createdDate: now,
      modifiedDate: now,
      name: name,
      columnIndex: j,
      rowIndex: 3,
    );
  }),
  List.generate(10, (j) {
    final name = 'E${j + 1}';
    return Seat(
      id: Random().nextInt(1000),
      createdDate: now,
      modifiedDate: now,
      name: name,
      columnIndex: j,
      rowIndex: 4,
    );
  }),
  List.generate(10, (j) {
    final name = 'F${j + 1}';
    return Seat(
      id: Random().nextInt(1000),
      createdDate: now,
      modifiedDate: now,
      name: name,
      columnIndex: j,
      rowIndex: 5,
    );
  }),
  List.generate(10, (j) {
    final name = 'G${j + 1}';
    return Seat(
      id: Random().nextInt(1000),
      createdDate: now,
      modifiedDate: now,
      name: name,
      columnIndex: j,
      rowIndex: 6,
    );
  }),
  [
    Seat(
      id: 20,
      createdDate: now,
      modifiedDate: now,
      name: '',
      columnIndex: 0,
      rowIndex: 7,
      isSeat: false,
    ),
    Seat(
      id: 21,
      createdDate: now,
      modifiedDate: now,
      name: 'H1',
      columnIndex: 1,
      rowIndex: 7,
      type: SeatType.couple,
    ),
    Seat(
      id: 22,
      createdDate: now,
      modifiedDate: now,
      name: 'H1',
      columnIndex: 2,
      rowIndex: 7,
      type: SeatType.couple,
      ref: Seat(
        id: 21,
        createdDate: now,
        modifiedDate: now,
        name: 'H1',
        columnIndex: 1,
        rowIndex: 7,
        type: SeatType.couple,
      ),
    ),
    Seat(
      id: 23,
      createdDate: now,
      modifiedDate: now,
      name: '',
      columnIndex: 3,
      rowIndex: 7,
      isSeat: false,
    ),
    Seat(
      id: 24,
      createdDate: now,
      modifiedDate: now,
      name: '',
      columnIndex: 4,
      rowIndex: 7,
      isSeat: false,
    ),
    Seat(
      id: 25,
      createdDate: now,
      modifiedDate: now,
      name: 'H2',
      columnIndex: 5,
      rowIndex: 7,
      type: SeatType.couple,
    ),
    Seat(
      id: 26,
      createdDate: now,
      modifiedDate: now,
      name: 'H2',
      columnIndex: 6,
      rowIndex: 7,
      type: SeatType.couple,
      ref: Seat(
        id: 25,
        createdDate: now,
        modifiedDate: now,
        name: 'H2',
        columnIndex: 5,
        rowIndex: 7,
        type: SeatType.couple,
      ),
    ),
    Seat(
      id: 27,
      createdDate: now,
      modifiedDate: now,
      name: 'H3',
      columnIndex: 7,
      rowIndex: 7,
      type: SeatType.couple,
    ),
    Seat(
      id: 28,
      createdDate: now,
      modifiedDate: now,
      name: 'H3',
      columnIndex: 8,
      rowIndex: 7,
      type: SeatType.couple,
      ref: Seat(
        id: 27,
        createdDate: now,
        modifiedDate: now,
        name: 'H4',
        columnIndex: 7,
        rowIndex: 7,
        type: SeatType.couple,
      ),
    ),
    Seat(
      id: 29,
      createdDate: now,
      modifiedDate: now,
      name: '',
      columnIndex: 9,
      rowIndex: 7,
      isSeat: false,
    ),
  ],
];

final demoRoom = Room(
  id: 1,
  createdDate: now,
  modifiedDate: now,
  name: 'Room 1',
  columnCount: demoSeats.first.length,
  rowCount: demoSeats.length,
  totalSeats: demoSeats.expand((element) => element).length,
  seats: demoSeats.expand((element) => element).toList(),
  state: RoomState.available,
);
