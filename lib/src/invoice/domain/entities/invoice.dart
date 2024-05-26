import 'package:cinemix_ui/core/common/entity/base_entity.dart';
import 'package:cinemix_ui/src/ticket/domain/entities/ticket.dart';

class Invoice extends BaseEntity {
  const Invoice({
    required this.code,
    required this.total,
    required this.tickets,
    required this.paid,
    required this.canceled,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  final int code;
  final int total;
  final List<Ticket> tickets;
  final bool paid;
  final bool canceled;

  @override
  List<Object?> get props => [
        ...super.props,
        code,
        total,
        tickets,
        paid,
        canceled,
      ];
}
