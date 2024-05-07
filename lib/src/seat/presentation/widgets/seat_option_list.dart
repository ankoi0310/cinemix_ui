import 'package:cinemix_ui/src/seat/domain/entities/ticket_price.dart';
import 'package:cinemix_ui/src/seat/presentation/widgets/seat_option_item.dart';
import 'package:flutter/material.dart';

class SeatOptionList extends StatelessWidget {
  const SeatOptionList({required this.ticketPrices, super.key});

  final List<TicketPrice> ticketPrices;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 4,
      children: ticketPrices.map(
        (ticketPrice) {
          return SeatOptionItem(ticketPrice: ticketPrice);
        },
      ).toList(),
    );
  }
}
