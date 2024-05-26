import 'package:cinemix_ui/core/common/widgets/app_bar.dart';
import 'package:cinemix_ui/core/common/widgets/custom_bottom_nav_bar.dart';
import 'package:cinemix_ui/src/user/presentation/widgets/booking_history_body.dart';
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
        body: BookingHistoryBody(),
        bottomNavigationBar: CustomBottomNavBar(
          currentRoute: routeName,
        ),
      ),
    );
  }
}
