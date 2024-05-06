import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/seat/data/models/seat_model.dart';
import 'package:cinemix_ui/src/seat/domain/entities/seat_row.dart';
import 'package:intl/intl.dart';

class SeatRowModel extends SeatRow {
  const SeatRowModel({
    required super.name,
    required super.seats,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  factory SeatRowModel.fromMap(DataMap map) {
    return SeatRowModel(
      id: map['id'] as int,
      name: map['name'] as String,
      seats: (map['seats'] as List)
          .map((e) => SeatModel.fromMap(e as DataMap))
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
      'seats': (seats as List<SeatModel>).map((e) => e.toMap()).toList(),
      'createdDate': createdDate,
      'modifiedDate': modifiedDate,
    };
  }

  SeatRowModel copyWith({
    int? id,
    String? name,
    List<SeatModel>? seats,
    DateTime? createdDate,
    DateTime? modifiedDate,
  }) {
    return SeatRowModel(
      id: id ?? this.id,
      name: name ?? this.name,
      seats: seats ?? this.seats,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
    );
  }
}
