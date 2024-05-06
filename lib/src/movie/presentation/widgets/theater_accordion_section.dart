import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class TheaterAccordionSection extends AccordionSection {
  TheaterAccordionSection({
    required super.header,
    required super.content,
    super.isOpen = false,
    super.rightIcon,
    super.headerBorderRadius,
    super.headerPadding,
    super.contentBackgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AccordionSection(
      isOpen: isOpen,
      header: header,
      rightIcon: rightIcon ??
          Icon(
            IconsaxPlusLinear.arrow_circle_down,
            size: 24,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
      headerBorderRadius: headerBorderRadius ?? 8,
      headerPadding: headerPadding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      contentBackgroundColor:
          contentBackgroundColor ?? Theme.of(context).colorScheme.secondary,
      content: content,
    );
  }
}
