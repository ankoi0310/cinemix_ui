import 'package:cinemix_ui/core/common/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  static const routeName = '/booking-history';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: KAppBar(
          hasBackButton: false,
          title: 'Lịch sử đặt vé',
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
