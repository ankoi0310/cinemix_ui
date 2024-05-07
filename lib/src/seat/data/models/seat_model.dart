import 'package:cinemix_ui/core/shared/enums/seat_enum.dart';
import 'package:cinemix_ui/core/shared/utils/date_util.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/seat/domain/entities/seat.dart';

class SeatModel extends Seat {
  const SeatModel({
    required super.name,
    required super.columnIndex,
    required super.seatIndex,
    required super.isSeat,
    super.id,
    super.style,
    super.createdDate,
    super.modifiedDate,
  });

  factory SeatModel.fromMap(DataMap map) {
    return SeatModel(
      id: map['id'] as int,
      name: map['name'] as String,
      columnIndex: map['columnIndex'] as int,
      seatIndex: map['seatIndex'] as int,
      isSeat: map['isSeat'] as bool,
      style:
          map['style'] != null ? (map['style'] as String).toSeatStyle() : null,
      createdDate: (map['createdDate'] as String).toDateTime(),
      modifiedDate: (map['modifiedDate'] as String).toDateTime(),
    );
  }

  DataMap toMap() {
    return {
      'id': id,
      'name': name,
      'columnIndex': columnIndex,
      'seatIndex': seatIndex,
      'isSeat': isSeat,
      'style': style?.name,
      'createdDate': createdDate?.format(),
      'modifiedDate': modifiedDate?.format(),
    };
  }

  SeatModel copyWith({
    int? id,
    String? name,
    int? columnIndex,
    int? seatIndex,
    bool? isSeat,
    SeatStyle? style,
    DateTime? createdDate,
    DateTime? modifiedDate,
  }) {
    return SeatModel(
      id: id ?? this.id,
      name: name ?? this.name,
      columnIndex: columnIndex ?? this.columnIndex,
      seatIndex: seatIndex ?? this.seatIndex,
      isSeat: isSeat ?? this.isSeat,
      style: style ?? this.style,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
    );
  }
}
