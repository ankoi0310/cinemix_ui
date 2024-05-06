import 'package:cinemix_ui/core/shared/enums/theater_enum.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/theater/domain/entities/theater.dart';
import 'package:intl/intl.dart';

class TheaterModel extends Theater {
  const TheaterModel({
    required super.name,
    required super.address,
    required super.hotline,
    required super.image,
    required super.state,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  factory TheaterModel.fromMap(DataMap map) {
    return TheaterModel(
      id: map['id'] as int,
      name: map['name'] as String,
      address: map['address'] as String,
      hotline: map['hotline'] as String,
      image: map['image'] as String,
      state: (map['state'] as String).toTheaterState(),
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
      'address': address,
      'hotline': hotline,
      'image': image,
      'state': state.toString(),
      'createdDate': createdDate,
      'modifiedDate': modifiedDate,
    };
  }

  TheaterModel copyWith({
    int? id,
    String? name,
    String? address,
    String? hotline,
    String? image,
    TheaterState? state,
    DateTime? createdDate,
    DateTime? modifiedDate,
  }) {
    return TheaterModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      hotline: hotline ?? this.hotline,
      image: image ?? this.image,
      state: state ?? this.state,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
    );
  }
}
