import 'package:cinemix_ui/src/invoice/presentation/widgets/invoice_detail_body.dart';
import 'package:flutter/material.dart';

class InvoiceDetailScreen extends StatelessWidget {
  const InvoiceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: InvoiceDetailBody(),
      ),
    );
  }
}
