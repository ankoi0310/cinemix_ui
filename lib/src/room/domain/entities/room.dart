import 'package:cinemix_ui/core/common/entity/base_entity.dart';
import 'package:cinemix_ui/src/room/domain/entities/seat.dart';
import 'package:cinemix_ui/src/room/domain/entities/theater.dart';

enum RoomState {
  available(
    value: 'AVAILABLE',
    nameVN: 'Còn trống',
    nameEN: 'Available',
  ),
  // Dang bao tri
  underMaintenance(
    value: 'UNDER_MAINTENANCE',
    nameVN: 'Đang bảo trì',
    nameEN: 'Under maintenance',
  ),
  // Dang chieu phim
  inUseForMovie(
    value: 'IN_USE_FOR_MOVIE',
    nameVN: 'Đang chiếu phim',
    nameEN: 'In use for movie',
  ),
  // Dang su dung cho su kien
  inUseForEvent(
    value: 'IN_USE_FOR_EVENT',
    nameVN: 'Đang sử dụng cho sự kiện',
    nameEN: 'In use for event',
  );

  const RoomState({
    required this.value,
    required this.nameVN,
    required this.nameEN,
  });

  factory RoomState.fromValue(String value) {
    return RoomState.values.firstWhere((e) => e.value == value);
  }

  final String value;
  final String nameVN;
  final String nameEN;
}

class Room extends BaseEntity {
  const Room({
    required super.id,
    required super.createdDate,
    required super.modifiedDate,
    required this.name,
    required this.columnCount,
    required this.rowCount,
    required this.totalSeats,
    required this.seats,
    required this.state,
    required this.theater,
  });

  final String name;
  final int columnCount;
  final int rowCount;
  final int totalSeats;
  final List<Seat> seats;
  final RoomState state;
  final Theater theater;

  @override
  List<Object?> get props => [
        ...super.props,
        name,
        columnCount,
        rowCount,
        totalSeats,
        seats,
        state,
        theater,
      ];
}
