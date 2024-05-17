import 'package:cinemix_ui/core/common/widgets/floating_back_button.dart';
import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/src/booking/presentation/widgets/ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class BookingSuccessBody extends StatelessWidget {
  const BookingSuccessBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned.fill(
          left: 16,
          right: 16,
          bottom: 16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.11),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Đặt vé thành công',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    IconsaxPlusLinear.tick_circle,
                    color: KAppColor.successColor,
                    size: 36,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const TicketWidget(),
            ],
          ),
        ),
        const FloatingBackButton(),
      ],
    );
  }
}
