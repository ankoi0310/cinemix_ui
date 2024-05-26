import 'package:cinemix_ui/core/common/widgets/app_bar.dart';
import 'package:cinemix_ui/src/invoice/domain/entities/invoice.dart';
import 'package:cinemix_ui/src/invoice/presentation/widgets/invoice_detail_body.dart';
import 'package:flutter/material.dart';

class InvoiceDetailScreen extends StatelessWidget {
  const InvoiceDetailScreen({required this.invoice, super.key});

  static const routeName = '/invoice-detail';

  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const KAppBar(title: 'Chi tiết hóa đơn'),
        body: InvoiceDetailBody(invoice: invoice),
      ),
    );
  }
}
