import 'package:cinemix_ui/core/res/media/media.dart';

enum Language {
  vi(KAppMedia.vietnamFlag),
  en(KAppMedia.englishFlag);

  const Language(this._flag);

  String get flag => _flag;

  final String _flag;
}

enum MovieLanguage {
  // Phụ đề, thuyết minh, lồng tiếng
  subtitle('subtitle', 'Phụ đề', 'Vietnamese subtitle'),
  voiceover('voiceover', 'Thuyết minh', 'Vietnamese voiceover'),
  dubbing('dubbing', 'Lồng tiếng', 'Vietnamese dubbing');

  const MovieLanguage(this.value, this.nameVN, this.nameEN);

  final String value;
  final String nameVN;
  final String nameEN;
}
