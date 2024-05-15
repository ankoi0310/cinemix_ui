import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/core/shared/enums/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          color: KAppColor.secondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: SvgPicture.asset(
          currentFlag,
          package: 'country_icons',
          width: 24,
        ),
      ),
    );
  }
}
