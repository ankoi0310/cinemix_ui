import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/showtime/domain/entities/showtime.dart';
import 'package:cinemix_ui/src/showtime/domain/usecases/search_showtime.dart';

abstract class ShowtimeRepository {
  const ShowtimeRepository();

  ResultFuture<List<Showtime>> search(ShowtimeSearchParams params);

  VoidFuture cacheSelectedShowtime(Showtime params);

  ResultFuture<Showtime?> getSelectedShowtime();
}
