import 'package:cinemix_ui/core/res/media/media.dart';

enum AppLanguage {
  vi(KAppMedia.flagVN),
  en(KAppMedia.flagEN);

  const AppLanguage(this._flag);

  String get flag => _flag;

  final String _flag;
}
