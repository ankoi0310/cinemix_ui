import 'package:cinemix_ui/core/res/media/media.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 44),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {},
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            shape: CircleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 10,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            child: Lottie.asset(
              KAppMedia.bookNow,
              width: 40,
              reverse: true,
              addRepaintBoundary: false,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Đặt vé ngay',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
