import 'package:cinemix_ui/core/common/widgets/ticket_widget.dart';
import 'package:cinemix_ui/src/invoice/domain/entities/invoice.dart';
import 'package:flutter/material.dart';

class InvoiceDetailBody extends StatelessWidget {
  const InvoiceDetailBody({required this.invoice, super.key});

  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TicketWidget(invoice: invoice),
        ],
      ),
    );
  }
}
