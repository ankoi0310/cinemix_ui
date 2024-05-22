import 'package:cinemix_ui/core/common/entity/base_entity.dart';
import 'package:cinemix_ui/src/ticket/domain/entities/ticket.dart';

class Invoice extends BaseEntity {
  const Invoice({
    required this.code,
    required this.total,
    required this.tickets,
    // required this.paymentMethod,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  final int code;
  final int total;
  final List<Ticket> tickets;
  // final PaymentMethod paymentMethod;

  @override
  List<Object?> get props => [
        ...super.props,
        code,
        total,
        tickets,
        // paymentMethod,
      ];
}
