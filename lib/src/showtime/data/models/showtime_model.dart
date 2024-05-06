import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/movie/data/models/movie_model.dart';
import 'package:cinemix_ui/src/seat/data/models/room_model.dart';
import 'package:cinemix_ui/src/seat/data/models/seat_model.dart';
import 'package:cinemix_ui/src/showtime/domain/entities/showtime.dart';
import 'package:intl/intl.dart';

class ShowtimeModel extends Showtime {
  const ShowtimeModel({
    required super.movie,
    required super.room,
    required super.startTime,
    required super.endTime,
    required super.date,
    required super.bookedSeats,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  factory ShowtimeModel.fromMap(DataMap map) {
    return ShowtimeModel(
      id: map['id'] as int,
      movie: MovieModel.fromMap(map['movie'] as DataMap),
      room: RoomModel.fromMap(map['room'] as DataMap),
      startTime: map['startTime'] as String,
      endTime: map['endTime'] as String,
      date: map['date'] as String,
      bookedSeats: (map['bookedSeats'] as List)
          .map((e) => SeatModel.fromMap(e as DataMap))
          .toList(),
      createdDate:
          DateFormat('dd/MM/yyyy HH:mm:ss').parse(map['createdDate'] as String),
      modifiedDate: DateFormat('dd/MM/yyyy HH:mm:ss')
          .parse(map['modifiedDate'] as String),
    );
  }

  DataMap toMap() {
    return {
      'movie': (movie as MovieModel).toMap(),
      'room': (room as RoomModel).toMap(),
      'start_time': startTime,
      'end_time': endTime,
      'date': date,
      'booked_seats': bookedSeats.map((e) => (e as SeatModel).toMap()).toList(),
    };
  }

  ShowtimeModel copyWith({
    MovieModel? movie,
    RoomModel? room,
    String? startTime,
    String? endTime,
    String? date,
    List<SeatModel> bookedSeats = const [],
    int? id,
    DateTime? createdDate,
    DateTime? modifiedDate,
  }) {
    return ShowtimeModel(
      movie: movie ?? this.movie,
      room: room ?? this.room,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      date: date ?? this.date,
      bookedSeats: bookedSeats.isNotEmpty ? bookedSeats : this.bookedSeats,
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
    );
  }
}
