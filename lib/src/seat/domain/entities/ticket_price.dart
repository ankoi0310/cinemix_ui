import 'package:cinemix_ui/core/common/entity/base_entity.dart';
import 'package:cinemix_ui/core/shared/enums/seat_enum.dart';

class TicketPrice extends BaseEntity {
  const TicketPrice({
    required this.name,
    required this.seatStyle,
    required this.price,
    required this.special,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  final String name;
  final SeatStyle seatStyle;
  final int price;
  final bool special;

  @override
  List<Object?> get props => [
        ...super.props,
        name,
        seatStyle,
        price,
        special,
      ];
}
