import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/movie/domain/entities/movie.dart';
import 'package:cinemix_ui/src/movie/domain/repositories/movie_repository.dart';
import 'package:equatable/equatable.dart';

class SearchMovie extends UsecaseWithParams<List<Movie>, MovieSearchParams> {
  const SearchMovie(this._repository);

  final MovieRepository _repository;

  @override
  ResultFuture<List<Movie>> call(MovieSearchParams params) =>
      _repository.searchMovie(params);
}

class MovieSearchParams extends Equatable {
  const MovieSearchParams({
    this.name,
    this.state,
  });

  final String? name;
  final String? state;

  @override
  List<Object?> get props => [name, state];
}
