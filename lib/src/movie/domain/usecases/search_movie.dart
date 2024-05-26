import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/movie/domain/entities/movie.dart';
import 'package:cinemix_ui/src/movie/domain/repositories/movie_repository.dart';

class SearchMovie extends UsecaseWithParams<List<Movie>, MovieSearchParams> {
  const SearchMovie(this._repository);

  final MovieRepository _repository;

  @override
  ResultFuture<List<Movie>> call(MovieSearchParams params) =>
      _repository.searchMovie(params);
}

class MovieSearchParams {
  const MovieSearchParams({
    this.keyword,
    this.state,
  });

  final String? keyword;
  final String? state;

  DataMap toMap() {
    return {
      'name': keyword,
      'state': state,
    };
  }

  String toQueryString() {
    final map = toMap();
    return map.entries
        .where((element) => element.value != null)
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value.toString())}')
        .join('&');
  }
}
