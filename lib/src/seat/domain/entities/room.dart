import 'package:cinemix_ui/core/common/entity/base_entity.dart';
import 'package:cinemix_ui/src/seat/domain/entities/seat_row.dart';
import 'package:cinemix_ui/src/theater/domain/entities/theater.dart';

class Room extends BaseEntity {
  const Room({
    required this.name,
    required this.maxRow,
    required this.maxColumn,
    required this.seatCount,
    required this.available,
    required this.theater,
    required this.rows,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  final String name;
  final int maxRow;
  final int maxColumn;
  final int seatCount;
  final bool available;
  final Theater theater;
  final List<SeatRow> rows;

  @override
  List<Object?> get props => [
        ...super.props,
        name,
        maxRow,
        maxColumn,
        seatCount,
        available,
        theater,
        rows,
      ];
}
