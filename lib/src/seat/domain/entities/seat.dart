import 'package:cinemix_ui/core/common/entity/base_entity.dart';
import 'package:cinemix_ui/core/shared/enums/seat_enum.dart';

class Seat extends BaseEntity {
  const Seat({
    required this.name,
    required this.columnIndex,
    required this.seatIndex,
    required this.isSeat,
    this.style,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  final String name;
  final int columnIndex;
  final int seatIndex;
  final bool isSeat;
  final SeatStyle? style;

  @override
  List<Object?> get props => [
        ...super.props,
        name,
        columnIndex,
        seatIndex,
        isSeat,
        style,
      ];
}
