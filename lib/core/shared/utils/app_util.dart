import 'package:cinemix_ui/src/seat/domain/entities/ticket_price.dart';
import 'package:flutter/material.dart';

class AppUtil {
  static bool isEmail(String email) {
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static bool isPhoneNumber(String phoneNumber) {
    final phoneRegex = RegExp(r'^[0-9]{10}$');
    return phoneRegex.hasMatch(phoneNumber);
  }

  static void showSnackBar(BuildContext context, String message) {
    // close showing snackbar
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static int getTotalPrice({
    required Map<int, int> selectedOptions,
    required List<TicketPrice> ticketPrices,
  }) {
    return selectedOptions.entries.fold<int>(
      0,
      (previousValue, seatOption) {
        final seatPrice = ticketPrices.firstWhere(
          (ticketPrice) => ticketPrice.id == seatOption.key,
        );
        return previousValue + seatPrice.price * seatOption.value;
      },
    );
  }
}
