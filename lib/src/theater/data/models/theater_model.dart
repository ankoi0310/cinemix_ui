import 'package:cinemix_ui/core/shared/enums/theater_enum.dart';
import 'package:cinemix_ui/core/shared/utils/date_util.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/seat/data/models/room_model.dart';
import 'package:cinemix_ui/src/seat/data/models/ticket_price_model.dart';
import 'package:cinemix_ui/src/theater/domain/entities/theater.dart';

class TheaterModel extends Theater {
  const TheaterModel({
    required super.name,
    required super.address,
    required super.hotline,
    required super.image,
    required super.state,
    required super.rooms,
    required super.ticketPrices,
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
      rooms: map['rooms'] != null
          ? (map['rooms'] as List)
              .map((e) => RoomModel.fromMap(e as DataMap))
              .toList()
          : [],
      ticketPrices: (map['ticketPrices'] as List)
          .map((e) => TicketPriceModel.fromMap(e as DataMap))
          .toList(),
      createdDate: (map['createdDate'] as String).toDateTime(),
      modifiedDate: (map['modifiedDate'] as String).toDateTime(),
    );
  }

  DataMap toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'hotline': hotline,
      'image': image,
      'state': state.name,
      'rooms': rooms.map((room) => (room as RoomModel).toMap()).toList(),
      'ticketPrices': ticketPrices
          .map((ticketPrice) => (ticketPrice as TicketPriceModel).toMap())
          .toList(),
      'createdDate': createdDate?.format(),
      'modifiedDate': modifiedDate?.format(),
    };
  }

  TheaterModel copyWith({
    int? id,
    String? name,
    String? address,
    String? hotline,
    String? image,
    TheaterState? state,
    List<RoomModel>? rooms,
    List<TicketPriceModel>? ticketPrices,
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
      rooms: rooms ?? this.rooms,
      ticketPrices: ticketPrices ?? this.ticketPrices,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
    );
  }
}
