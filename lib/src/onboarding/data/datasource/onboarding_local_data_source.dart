import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnboardingLocalDataSource {
  const OnboardingLocalDataSource();

  Future<void> cacheFirstTime();

  Future<bool> isFirstTime();
}

const kFirstTimeKey = 'first_time';

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  const OnboardingLocalDataSourceImpl(this._prefs);

  final SharedPreferences _prefs;

  @override
  Future<void> cacheFirstTime() async {
    try {
      await _prefs.setBool(kFirstTimeKey, false);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> isFirstTime() async {
    try {
      return _prefs.getBool(kFirstTimeKey) ?? true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
