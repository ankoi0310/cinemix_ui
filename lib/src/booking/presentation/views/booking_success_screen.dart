import 'package:cinemix_ui/src/booking/presentation/widgets'
    '/booking_success_body.dart';
import 'package:flutter/material.dart';

class BookingSuccessScreen extends StatelessWidget {
  const BookingSuccessScreen({super.key});

  static const routeName = '/booking-success';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookingSuccessBody(),
    );
  }
}
