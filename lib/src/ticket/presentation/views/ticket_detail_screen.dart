import 'package:cinemix_ui/src/ticket/presentation/widgets/ticket_detail_body.dart';
import 'package:flutter/material.dart';

class TicketDetailScreen extends StatelessWidget {
  const TicketDetailScreen({super.key});

  static const routeName = '/ticket-detail';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TicketDetailBody(),
    );
  }
}
