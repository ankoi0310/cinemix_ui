import 'dart:convert';

import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/movie/data/models/movie_model.dart';
import 'package:cinemix_ui/src/movie/domain/entities/movie.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tMovieModel = MovieModel.demo();

  test('should be a subclass of [Movie] entity', () {
    // assert
    expect(tMovieModel, isA<Movie>());
  });

  final tMap = jsonDecode(fixture('movie.json')) as DataMap;
  group('fromMap', () {
    test('should return a valid [MovieModel] from the map', () {
      // act
      final result = MovieModel.fromMap(tMap);

      // assert
      expect(result, isA<MovieModel>());
      expect(result, equals(tMovieModel));
    });

    test('should throw an [Error] when the map is invalid', () {
      // act
      MovieModel call() => MovieModel.fromMap(const {});

      // assert
      expect(call, throwsA(isA<Error>()));
    });
  });

  group('toMap', () {
    test('should return a valid [DataMap] from the model', () {
      // act
      final result = tMovieModel.toMap();
      // assert
      expect(result, equals(tMap));
    });
  });

  group('copyWith', () {
    test('should return a valid [MovieModel] with the new values', () {
      // act
      final result = tMovieModel.copyWith(
        id: 0,
        name: '',
        description: '',
        directors: '',
        actors: '',
        genres: const [],
        releasedDate: DateTime.now(),
        duration: 0,
        country: '',
        language: '',
        localizations: '',
        format: '',
        rating: '',
        posterUrl: '',
        trailerUrl: '',
        state: '',
      );

      // assert
      expect(result, isA<MovieModel>());
      expect(
        result,
        equals(
          MovieModel(
            name: '',
            description: '',
            directors: '',
            actors: '',
            genres: const [],
            releasedDate: DateTime.now(),
            duration: 0,
            country: '',
            language: '',
            localizations: '',
            format: '',
            rating: '',
            posterUrl: '',
            trailerUrl: '',
            state: '',
          ),
        ),
      );
    });
  });
}
