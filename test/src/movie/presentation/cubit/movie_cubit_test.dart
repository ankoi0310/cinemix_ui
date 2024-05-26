import 'package:bloc_test/bloc_test.dart';
import 'package:cinemix_ui/core/errors/failures.dart';
import 'package:cinemix_ui/src/movie/domain/entities/movie.dart';
import 'package:cinemix_ui/src/movie/domain/usecases/get_movie_by_id.dart';
import 'package:cinemix_ui/src/movie/domain/usecases/search_movie.dart';
import 'package:cinemix_ui/src/movie/presentation/cubit/movie_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSearchMovie extends Mock implements SearchMovie {}

class MockGetMovieById extends Mock implements GetMovieById {}

void main() {
  late SearchMovie searchMovie;
  late GetMovieById getMovieById;
  late MovieCubit cubit;

  setUp(() {
    searchMovie = MockSearchMovie();
    getMovieById = MockGetMovieById();
    cubit = MovieCubit(
      searchMovie: searchMovie,
      getMovieById: getMovieById,
    );
  });

  test(
    'initial state should be [MovieInitial]',
    () {
      expect(cubit.state, const MovieInitial());
    },
  );

  final tFailure = ServerFailure(
    message: 'Something went wrong',
    statusCode: 500,
  );

  const tMovieSearchParams = MovieSearchParams();

  final tMovies = <Movie>[];

  group('searchMovie', () {
    blocTest<MovieCubit, MovieState>(
      'should emit [SearchingMovie, SearchMovieSuccess] when successful',
      build: () {
        when(() => searchMovie(tMovieSearchParams))
            .thenAnswer((_) async => Right(tMovies));
        return cubit;
      },
      act: (cubit) => cubit.searchMovie(),
      expect: () => [
        const SearchingMovie(),
        SearchMovieSuccess(tMovies),
      ],
      verify: (_) {
        verify(() => searchMovie(tMovieSearchParams)).called(1);
        verifyNoMoreInteractions(searchMovie);
      },
    );

    blocTest<MovieCubit, MovieState>(
      'should emit [SearchingMovie, MovieError] when unsuccessful',
      build: () {
        when(() => searchMovie(tMovieSearchParams))
            .thenAnswer((_) async => Left(tFailure));
        return cubit;
      },
      act: (cubit) => cubit.searchMovie(),
      expect: () => [
        const SearchingMovie(),
        MovieError(tFailure.message),
      ],
      verify: (_) {
        verify(() => searchMovie(tMovieSearchParams)).called(1);
        verifyNoMoreInteractions(searchMovie);
      },
    );
  });
}
