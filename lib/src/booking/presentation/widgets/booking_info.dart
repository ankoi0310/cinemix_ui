import 'package:cinemix_ui/core/common/widgets/booking_history_button.dart';
import 'package:cinemix_ui/src/booking/presentation/widgets/invoice_info_detail.dart';
import 'package:cinemix_ui/src/booking/presentation/widgets/showtime_info_detail.dart';
import 'package:cinemix_ui/src/invoice/domain/entities/invoice.dart';
import 'package:flutter/material.dart';

class BookingInfo extends StatelessWidget {
  const BookingInfo({required this.invoice, super.key});

  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              InvoiceInfoDetail(invoice: invoice),
              const SizedBox(height: 16),
              ShowtimeInfoDetail(tickets: invoice.tickets),
            ],
          ),
        ),
        const Spacer(),
        const BookingHistoryButton(),
      ],
    );
  }
}
