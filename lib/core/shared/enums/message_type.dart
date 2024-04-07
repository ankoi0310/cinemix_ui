import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:flutter/material.dart';

enum MessageType {
  success(color: KAppColor.successColor),
  error(color: KAppColor.errorColor),
  warning(color: KAppColor.warningColor),
  info(color: KAppColor.infoColor);

  const MessageType({
    required this.color,
  });

  final Color color;
}
