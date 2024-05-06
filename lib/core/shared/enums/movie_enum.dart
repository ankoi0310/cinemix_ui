import 'dart:ui';

import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:flutter/material.dart';

enum MovieState {
  showing(value: 'SHOWING', nameVN: 'Đang chiếu', nameEN: 'Now showing'),
  comingSoon(value: 'COMING_SOON', nameVN: 'Sắp chiếu', nameEN: 'Coming soon'),
  end(value: 'END', nameVN: 'Ngưng chiếu', nameEN: 'End');

  const MovieState({
    required this.value,
    required this.nameVN,
    required this.nameEN,
  });

  final String value;
  final String nameVN;
  final String nameEN;

  static MovieState fromValue(String value) {
    switch (value) {
      case 'showing':
        return MovieState.showing;
      case 'coming_soon':
        return MovieState.comingSoon;
      case 'end':
        return MovieState.end;
      default:
        throw ArgumentError('Invalid movie state value: $value');
    }
  }
}

enum MovieRating {
  p(
    value: 'P',
    textColor: Color(0xFFFFFFFF),
    backgroundColor: KAppColor.successColor,
  ),
  k(
    value: 'K',
    textColor: Color(0xFF000000),
    backgroundColor: KAppColor.infoColor,
  ),
  t13(
    value: 'T13',
    textColor: Color(0xFF000000),
    backgroundColor: KAppColor.warningColor,
  ),
  t16(
    value: 'T16',
    textColor: Color(0xFF000000),
    backgroundColor: KAppColor.warningColor,
  ),
  t18(
    value: 'T18',
    textColor: Color(0xFF000000),
    backgroundColor: KAppColor.warningColor,
  );

  const MovieRating({
    required this.value,
    required this.textColor,
    required this.backgroundColor,
  });

  final String value;
  final Color textColor;
  final Color backgroundColor;

  static MovieRating fromValue(String value) {
    switch (value) {
      case 'P':
        return MovieRating.p;
      case 'K':
        return MovieRating.k;
      case 'T13':
        return MovieRating.t13;
      case 'T16':
        return MovieRating.t16;
      case 'T18':
        return MovieRating.t18;
      default:
        throw ArgumentError('Invalid movie rating value: $value');
    }
  }
}
