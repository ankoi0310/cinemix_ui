import 'package:flutter/material.dart';

class CheckoutFailedScreen extends StatelessWidget {
  const CheckoutFailedScreen({super.key});

  static const routeName = '/checkout-failed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.error,
              color: Colors.red,
              size: 64,
            ),
            SizedBox(height: 16),
            Text(
              'Thanh toán thất bại',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
