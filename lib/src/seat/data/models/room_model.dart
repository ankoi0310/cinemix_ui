import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/seat/data/models/seat_row_model.dart';
import 'package:cinemix_ui/src/seat/domain/entities/room.dart';
import 'package:cinemix_ui/src/theater/data/models/theater_model.dart';
import 'package:intl/intl.dart';

class RoomModel extends Room {
  const RoomModel({
    required super.name,
    required super.maxRow,
    required super.maxColumn,
    required super.seatCount,
    required super.available,
    required super.theater,
    required super.rows,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  factory RoomModel.fromMap(DataMap map) {
    return RoomModel(
      id: map['id'] as int,
      name: map['name'] as String,
      maxRow: map['maxRow'] as int,
      maxColumn: map['maxColumn'] as int,
      seatCount: map['seatCount'] as int,
      available: map['available'] as bool,
      theater: TheaterModel.fromMap(map['theater'] as DataMap),
      rows: (map['rows'] as List)
          .map((e) => SeatRowModel.fromMap(e as DataMap))
          .toList(),
      createdDate:
          DateFormat('dd/MM/yyyy HH:mm:ss').parse(map['createdDate'] as String),
      modifiedDate: DateFormat('dd/MM/yyyy HH:mm:ss')
          .parse(map['modifiedDate'] as String),
    );
  }

  DataMap toMap() {
    return {
      'id': id,
      'name': name,
      'maxRow': maxRow,
      'maxColumn': maxColumn,
      'seatCount': seatCount,
      'available': available,
      'theater': (theater as TheaterModel).toMap(),
      'rows': (rows as List<SeatRowModel>).map((e) => e.toMap()).toList(),
      'createdDate': createdDate,
      'modifiedDate': modifiedDate,
    };
  }

  RoomModel copyWith({
    int? id,
    String? name,
    int? maxRow,
    int? maxColumn,
    int? seatCount,
    bool? available,
    TheaterModel? theater,
    List<SeatRowModel>? rows,
    DateTime? createdDate,
    DateTime? modifiedDate,
  }) {
    return RoomModel(
      id: id ?? this.id,
      name: name ?? this.name,
      maxRow: maxRow ?? this.maxRow,
      maxColumn: maxColumn ?? this.maxColumn,
      seatCount: seatCount ?? this.seatCount,
      available: available ?? this.available,
      theater: theater ?? this.theater,
      rows: rows ?? this.rows,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
    );
  }
}
