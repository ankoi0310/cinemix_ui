import 'package:cinemix_ui/core/common/entity/base_entity.dart';
import 'package:cinemix_ui/src/movie_detail/domain/entities/showtime.dart';
import 'package:equatable/equatable.dart';

enum SeatState {
  available(
    value: 'AVAILABLE',
    nameVN: 'Còn trống',
    nameEN: 'Available',
  ),
  booked(
    value: 'BOOKED',
    nameVN: 'Đã đặt',
    nameEN: 'Booked',
  ),
  selected(
    value: 'SELECTED',
    nameVN: 'Đã chọn',
    nameEN: 'Selected',
  );

  const SeatState({
    required this.value,
    required this.nameVN,
    required this.nameEN,
  });

  factory SeatState.fromValue(String value) {
    return SeatState.values.firstWhere((e) => e.value == value);
  }

  final String value;
  final String nameVN;
  final String nameEN;
}

enum SeatType {
  single(value: 'SINGLE', nameVN: 'Ghế đơn', nameEN: 'Single'),
  couple(value: 'COUPLE', nameVN: 'Ghế đôi', nameEN: 'Couple');

  const SeatType({
    required this.value,
    required this.nameVN,
    required this.nameEN,
  });

  factory SeatType.fromValue(String value) {
    return SeatType.values.firstWhere((e) => e.value == value);
  }

  final String value;
  final String nameVN;
  final String nameEN;
}

class Seat extends BaseEntity {
  const Seat({
    required super.id,
    required super.createdDate,
    required super.modifiedDate,
    required this.name,
    required this.columnIndex,
    required this.rowIndex,
    this.isSeat = true,
    this.type = SeatType.single,
    this.ref,
  });

  final String name;
  final int columnIndex;
  final int rowIndex;
  final bool isSeat;
  final SeatType type;
  final Seat? ref;

  @override
  List<Object?> get props => [
        ...super.props,
        name,
        columnIndex,
        rowIndex,
        isSeat,
        type,
        ref,
      ];
}

class BookedSeat extends Equatable {
  const BookedSeat({
    required this.id,
    required this.showtime,
    required this.seat,
  });

  final int id;
  final Showtime showtime;
  final Seat seat;

  @override
  List<Object> get props => [
        id,
        showtime,
        seat,
      ];
}
