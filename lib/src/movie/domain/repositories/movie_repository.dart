import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/movie/domain/entities/movie.dart';
import 'package:cinemix_ui/src/movie/domain/usecases/search_movie.dart';

abstract class MovieRepository {
  const MovieRepository();

  ResultFuture<List<Movie>> searchMovie(MovieSearchParams params);
  ResultFuture<Movie> getMovieById(int id);
}
