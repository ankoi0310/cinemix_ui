import 'package:bloc/bloc.dart';
import 'package:cinemix_ui/core/shared/enums/movie_state_enum.dart';
import 'package:cinemix_ui/src/movie/domain/entities/movie.dart';
import 'package:cinemix_ui/src/movie/domain/usecases/get_movie_by_id.dart';
import 'package:cinemix_ui/src/movie/domain/usecases/search_movie.dart';
import 'package:equatable/equatable.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit({
    required GetMovieById getMovieById,
    required SearchMovie searchMovie,
  })  : _getMovieById = getMovieById,
        _searchMovie = searchMovie,
        super(const MovieInitial());

  final GetMovieById _getMovieById;
  final SearchMovie _searchMovie;

  Future<void> getMovieById(int id) async {
    emit(const MovieLoading());
    final result = await _getMovieById(id);

    result.fold(
      (l) => emit(MovieError(l.message)),
      (r) => emit(MovieDetailLoaded(r)),
    );
  }

  Future<void> searchMovie({
    String? name,
    String? state,
  }) async {
    emit(const MovieLoading());
    final result = await _searchMovie(
      MovieSearchParams(
        name: name,
        state: state,
      ),
    );

    result.fold(
      (l) => emit(MovieError(l.message)),
      (r) => emit(MovieListLoaded(r)),
    );
  }
}
