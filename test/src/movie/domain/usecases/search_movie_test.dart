import 'package:cinemix_ui/src/movie/domain/entities/movie.dart';
import 'package:cinemix_ui/src/movie/domain/usecases/search_movie.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'movie_repository.mock.dart';

void main() {
  late MockMovieRepository repository;
  late SearchMovie usecase;

  setUp(() {
    repository = MockMovieRepository();
    usecase = SearchMovie(repository);
  });

  final tMovies = <Movie>[];
  const tParams = MovieSearchParams();
  test(
    'should return [List<Movie>] from the repositories',
    () async {
      // arrange
      when(
        () => repository.searchMovie(tParams),
      ).thenAnswer((_) async => Right(tMovies));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, Right<dynamic, List<Movie>>(tMovies));
      verify(() => repository.searchMovie(tParams)).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
