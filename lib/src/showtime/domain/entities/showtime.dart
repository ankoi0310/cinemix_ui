import 'package:cinemix_ui/core/common/entity/base_entity.dart';
import 'package:cinemix_ui/src/movie/domain/entities/movie.dart';
import 'package:cinemix_ui/src/seat/domain/entities/room.dart';
import 'package:cinemix_ui/src/seat/domain/entities/seat.dart';

class Showtime extends BaseEntity {
  const Showtime({
    required this.movie,
    required this.room,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.bookedSeats,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  final Movie movie;
  final Room room;
  final String startTime;
  final String endTime;
  final String date;
  final List<Seat> bookedSeats;

  @override
  List<Object?> get props => [
        ...super.props,
        movie,
        room,
        startTime,
        endTime,
        date,
        bookedSeats,
      ];
}
