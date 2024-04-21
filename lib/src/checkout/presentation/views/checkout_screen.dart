import 'package:cinemix_ui/src/checkout/presentation/widgets/body.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  static const String routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CheckoutBody(),
    );
  }
}
