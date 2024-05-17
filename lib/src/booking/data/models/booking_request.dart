import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/seat/data/models/seat_model.dart';
import 'package:cinemix_ui/src/showtime/data/models/showtime_model.dart';
import 'package:equatable/equatable.dart';

class BookingRequest extends Equatable {
  const BookingRequest({
    required this.showtime,
    required this.seats,
    required this.total,
  });

  final ShowtimeModel showtime;
  final List<SeatModel> seats;
  final int total;

  DataMap toMap() {
    return {
      'showtime': showtime.toMap(),
      'seats': seats.map((e) => e.toMap()).toList(),
      'total': total,
    };
  }

  @override
  List<Object?> get props => [showtime, seats, total];
}
