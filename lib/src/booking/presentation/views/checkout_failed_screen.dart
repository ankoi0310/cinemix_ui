import 'package:cinemix_ui/core/common/widgets/app_bar.dart';
import 'package:cinemix_ui/src/booking/presentation/widgets/checkout_failed_body.dart';
import 'package:cinemix_ui/src/home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';

class CheckoutFailedScreen extends StatelessWidget {
  const CheckoutFailedScreen({super.key});

  static const routeName = '/checkout-failed';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: KAppBar(
          title: 'Chi tiết giao dịch',
          centerTitle: true,
          hasBackButton: false,
          hasCloseButton: true,
          onClosePressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              HomeScreen.routeName,
              (route) => false,
            );
          },
        ),
        body: const CheckoutFailedBody(),
      ),
    );
  }
}
