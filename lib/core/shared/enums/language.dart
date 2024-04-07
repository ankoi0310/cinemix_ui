import 'package:cinemix_ui/core/res/media/media.dart';

enum Language {
  vi(KAppMedia.vietnamFlag),
  en(KAppMedia.englishFlag);

  const Language(this._flag);

  String get flag => _flag;

  final String _flag;
}
