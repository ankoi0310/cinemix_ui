import 'package:cinemix_ui/core/common/entity/base_entity.dart';
import 'package:cinemix_ui/src/seat/domain/entities/seat.dart';

class SeatRow extends BaseEntity {
  const SeatRow({
    required this.name,
    required this.seats,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  final String name;
  final List<Seat> seats;

  @override
  List<Object?> get props => [
        ...super.props,
        name,
        seats,
      ];
}
