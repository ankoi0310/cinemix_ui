import 'package:cinemix_ui/core/shared/enums/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

class SwitchLanguageButton extends StatefulWidget {
  const SwitchLanguageButton({super.key});

  @override
  State<SwitchLanguageButton> createState() => _SwitchLanguageButtonState();
}

class _SwitchLanguageButtonState extends State<SwitchLanguageButton> {
  String currentFlag = AppLanguage.vi.flag;

  void switchLanguage() {
    setState(() {
      currentFlag = currentFlag == AppLanguage.vi.flag
          ? AppLanguage.en.flag
          : AppLanguage.vi.flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: switchLanguage,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 9,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              currentFlag,
              package: 'country_icons',
              width: 24,
            ),
            const SizedBox(width: 4),
            const Icon(
              Iconsax.arrow_right1,
              size: 16,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
