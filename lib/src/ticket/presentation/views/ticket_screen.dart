import 'package:cinemix_ui/src/ticket/presentation/widgets/ticket_body.dart';
import 'package:flutter/material.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  static const routeName = '/ticket';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TicketBody(),
    );
  }
}
