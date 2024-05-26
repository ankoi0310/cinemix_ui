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
    this.keyword,
    this.state,
  });

  final String? keyword;
  final String? state;

  @override
  List<Object?> get props => [keyword, state];

  DataMap toMap() {
    return {
      'keyword': keyword,
      'state': state,
    };
  }

  String toQueryString() {
    final map = toMap();
    return map.entries.where((element) => element.value != null).map(
      (e) {
        final encodedKey = Uri.encodeComponent(e.key);
        final encodedValue = Uri.encodeComponent(e.value.toString());
        return '$encodedKey=$encodedValue';
      },
    ).join('&');
  }
}
