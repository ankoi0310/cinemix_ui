import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/showtime/domain/entities/showtime.dart';
import 'package:cinemix_ui/src/showtime/domain/repositories/showtime_repository.dart';

class SearchShowtime
    extends UsecaseWithParams<List<Showtime>, ShowtimeSearchParams> {
  SearchShowtime(this._repository);

  final ShowtimeRepository _repository;

  @override
  ResultFuture<List<Showtime>> call(ShowtimeSearchParams params) {
    return _repository.search(params);
  }
}

class ShowtimeSearchParams {
  const ShowtimeSearchParams({
    this.movie,
    this.theater,
    this.date,
  });

  final int? movie;
  final int? theater;
  final String? date;

  DataMap toMap() {
    return {
      'movie': movie,
      'theater': theater,
      'date': date,
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
