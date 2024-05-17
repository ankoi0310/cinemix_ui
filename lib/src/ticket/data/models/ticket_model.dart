import 'package:cinemix_ui/core/shared/utils/date_util.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/seat/data/models/seat_model.dart';
import 'package:cinemix_ui/src/showtime/data/models/showtime_model.dart';
import 'package:cinemix_ui/src/ticket/domain/entities/ticket.dart';

class TicketModel extends Ticket {
  const TicketModel({
    required super.showtime,
    required super.seat,
    required super.price,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  factory TicketModel.fromMap(DataMap json) {
    return TicketModel(
      id: json['id'] as int,
      showtime: ShowtimeModel.fromMap(json['showtime'] as DataMap),
      seat: SeatModel.fromMap(json['seat'] as DataMap),
      price: json['price'] as int,
      createdDate: (json['createdDate'] as String).toDateTime(),
      modifiedDate: (json['modifiedDate'] as String).toDateTime(),
    );
  }
}
