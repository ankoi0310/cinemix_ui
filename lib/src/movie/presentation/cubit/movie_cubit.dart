import 'package:bloc/bloc.dart';
import 'package:cinemix_ui/core/shared/enums/movie_enum.dart' as movie_enum;
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
    emit(const SearchingMovie());
    final result = await _getMovieById(id);

    result.fold(
      (l) => emit(MovieError(l.message)),
      (r) => emit(MovieDetailLoaded(r)),
    );
  }

  // 8. The application calls the searchMovie event with the keyword
  Future<void> searchMovie({
    String? keyword,
    String? state,
  }) async {
    // 9. The application emits the SearchingMovie state
    emit(const SearchingMovie());
    // 12. The application creates request search movie with the params
    final result = await _searchMovie(
      // 11. The application creates the MovieSearchParams object
      MovieSearchParams(
        keyword: keyword,
        state: state,
      ),
    );

    result.fold(
      (l) => emit(MovieError(l.message)),
      // 16. The application emits the SearchMovieSuccess state with the result
      // is the list of movies
      (r) => emit(SearchMovieSuccess(r)),
    );
  }
}
