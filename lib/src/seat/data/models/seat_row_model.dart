import 'package:cinemix_ui/core/shared/utils/date_util.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/seat/data/models/seat_model.dart';
import 'package:cinemix_ui/src/seat/domain/entities/seat_row.dart';

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
      createdDate: (map['createdDate'] as String).toDateTime(),
      modifiedDate: (map['modifiedDate'] as String).toDateTime(),
    );
  }

  DataMap toMap() {
    return {
      'id': id,
      'name': name,
      'seats': seats.map((e) => (e as SeatModel).toMap()).toList(),
      'createdDate': createdDate?.format(),
      'modifiedDate': modifiedDate?.format(),
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
