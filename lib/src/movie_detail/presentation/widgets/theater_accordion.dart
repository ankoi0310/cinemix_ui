import 'package:accordion/accordion.dart';
import 'package:cinemix_ui/core/common/widgets/showtime_item.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class TheaterAccordion extends StatelessWidget {
  const TheaterAccordion({super.key});

  @override
  Widget build(BuildContext context) {
    return Accordion(
      maxOpenSections: 1,
      scaleWhenAnimating: false,
      paddingListHorizontal: 0,
      disableScrolling: true,
      paddingListBottom: 0,
      children: [
        buildAccordionSection(
          context,
          theaterName: 'CGV Vincom Đồng Khởi',
          address:
              'L3 - 19, Vincom Center B, 72 Lê Thánh Tôn, Bến Nghé, Quận 1, Hồ Chí Minh',
        ),
      ],
    );
  }

  AccordionSection buildAccordionSection(
    BuildContext context, {
    required String theaterName,
    required String address,
  }) {
    return AccordionSection(
      rightIcon: Icon(
        IconsaxPlusLinear.arrow_circle_down,
        size: 24,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      headerBorderRadius: 8,
      headerPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      contentBackgroundColor: Theme.of(context).colorScheme.secondary,
      header: Text(
        theaterName,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
      ),
      content: Column(
        children: [
          Text(address),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 8),
            child: const Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ShowtimeItem(time: '07:00', isSelected: true),
                ShowtimeItem(time: '09:00'),
                ShowtimeItem(time: '09:00'),
                ShowtimeItem(time: '09:00'),
                ShowtimeItem(time: '09:00'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
