import 'package:cinemix_ui/src/booking/presentation/widgets'
    '/booking_success_body.dart';
import 'package:flutter/material.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  const CheckoutSuccessScreen({required this.orderCode, super.key});

  static const routeName = '/checkout-success';

  final int orderCode;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookingSuccessBody(),
    );
  }
}
