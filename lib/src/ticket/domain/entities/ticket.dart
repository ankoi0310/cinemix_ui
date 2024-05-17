import 'package:cinemix_ui/core/common/entity/base_entity.dart';
import 'package:cinemix_ui/src/seat/domain/entities/seat.dart';
import 'package:cinemix_ui/src/showtime/domain/entities/showtime.dart';

class Ticket extends BaseEntity {
  const Ticket({
    required this.showtime,
    required this.seat,
    required this.price,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  final Showtime showtime;
  final Seat seat;
  final int price;

  @override
  List<Object?> get props => [
        ...super.props,
        showtime,
        seat,
        price,
      ];
}
