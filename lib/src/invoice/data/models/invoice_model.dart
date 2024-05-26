import 'package:cinemix_ui/core/shared/utils/date_util.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/invoice/domain/entities/invoice.dart';
import 'package:cinemix_ui/src/ticket/data/models/ticket_model.dart';

class InvoiceModel extends Invoice {
  const InvoiceModel({
    required super.code,
    required super.total,
    required super.tickets,
    required super.paid,
    required super.canceled,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  factory InvoiceModel.fromMap(DataMap map) {
    return InvoiceModel(
      id: map['id'] as int,
      code: map['code'] as int,
      total: map['total'] as int,
      tickets: (map['tickets'] as List)
          .map((e) => TicketModel.fromMap(e as DataMap))
          .toList(),
      paid: map['paid'] as bool,
      canceled: map['canceled'] as bool,
      createdDate: (map['createdDate'] as String).toDateTime(),
      modifiedDate: (map['modifiedDate'] as String).toDateTime(),
    );
  }
}
