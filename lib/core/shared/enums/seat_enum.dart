import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:flutter/material.dart';

enum SeatStyle {
  single('Đơn'),
  couple('Đôi'),
  bed('Giường');

  const SeatStyle(this.title);

  final String title;
}

enum SeatColor {
  single(title: 'Ghế đơn', color: KAppColor.primaryColor),
  couple(title: 'Ghế đôi', color: Color(0xFFA96C86)),
  bed(title: 'Giường nằm', color: Color(0xFF3A913A)),
  booked(title: 'Đã bán', color: Color(0xFF9A9A9A)),
  selecting(title: 'Đang chọn', color: Color(0xFF36B2FF));

  const SeatColor({required this.title, required this.color});

  final String title;
  final Color color;
}

extension SeatStyleX on String {
  SeatStyle toSeatStyle() {
    switch (toLowerCase()) {
      case 'single':
        return SeatStyle.single;
      case 'couple':
        return SeatStyle.couple;
      case 'bed':
        return SeatStyle.bed;
      default:
        throw Exception('Invalid SeatStyle');
    }
  }
}
