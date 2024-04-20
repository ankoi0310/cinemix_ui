import 'package:cinemix_ui/core/common/entity/base_entity.dart';
import 'package:cinemix_ui/src/movie_detail/domain/entities/movie.dart';
import 'package:cinemix_ui/src/room/domain/entities/room.dart';

class Showtime extends BaseEntity {
  const Showtime({
    required super.id,
    required super.createdDate,
    required super.modifiedDate,
    required this.movie,
    required this.room,
    required this.startTime,
    required this.endTime,
  });

  final Movie movie;
  final Room room;
  final DateTime startTime;
  final DateTime endTime;

  @override
  List<Object?> get props => [
        ...super.props,
        movie,
        room,
        startTime,
        endTime,
      ];
}
