import 'package:flutter/material.dart';

class BookingFailedScreen extends StatelessWidget {
  const BookingFailedScreen({super.key});

  static const routeName = '/failed-payment';

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
