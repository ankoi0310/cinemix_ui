import 'package:cinemix_ui/core/shared/enums/seat_enum.dart';
import 'package:cinemix_ui/core/shared/utils/date_util.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/seat/domain/entities/ticket_price.dart';

class TicketPriceModel extends TicketPrice {
  const TicketPriceModel({
    required super.name,
    required super.seatStyle,
    required super.price,
    required super.special,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  factory TicketPriceModel.fromMap(DataMap map) {
    return TicketPriceModel(
      id: map['id'] as int,
      name: map['name'] as String,
      seatStyle: (map['seatStyle'] as String).toSeatStyle(),
      price: map['price'] as int,
      special: map['special'] as bool,
      createdDate: (map['createdDate'] as String).toDateTime(),
      modifiedDate: (map['modifiedDate'] as String).toDateTime(),
    );
  }

  DataMap toMap() {
    return {
      'id': id,
      'name': name,
      'seatStyle': seatStyle.name,
      'price': price,
      'special': special,
      'createdDate': createdDate?.format(),
      'modifiedDate': modifiedDate?.format(),
    };
  }

  TicketPriceModel copyWith({
    String? name,
    SeatStyle? seatStyle,
    int? price,
    bool? special,
    int? id,
    DateTime? createdDate,
    DateTime? modifiedDate,
  }) {
    return TicketPriceModel(
      name: name ?? this.name,
      seatStyle: seatStyle ?? this.seatStyle,
      price: price ?? this.price,
      special: special ?? this.special,
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
    );
  }
}
