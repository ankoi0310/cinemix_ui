import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/movie/domain/entities/movie.dart';
import 'package:cinemix_ui/src/movie/domain/repositories/movie_repository.dart';

class GetMovieById extends UsecaseWithParams<Movie, int> {
  const GetMovieById(this._repository);

  final MovieRepository _repository;

  @override
  ResultFuture<Movie> call(int params) => _repository.getMovieById(params);
}
