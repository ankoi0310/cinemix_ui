import 'dart:convert';

import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/showtime/data/models/showtime_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ShowtimeLocalDataSource {
  const ShowtimeLocalDataSource();

  Future<void> cacheSelectedShowtime(ShowtimeModel params);

  Future<ShowtimeModel?> getSelectedShowtime();

  Future<void> clearCachedShowtime();
}

class ShowtimeLocalDataSourceImpl implements ShowtimeLocalDataSource {
  const ShowtimeLocalDataSourceImpl(this._prefs);

  final SharedPreferences _prefs;

  @override
  Future<void> cacheSelectedShowtime(ShowtimeModel params) async {
    try {
      final showtimeString = jsonEncode(params.toMap());
      await _prefs.setString('selectedShowtime', showtimeString);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<ShowtimeModel?> getSelectedShowtime() async {
    try {
      final showtimeString = _prefs.getString('selectedShowtime');
      if (showtimeString != null) {
        final showtimeMap = jsonDecode(showtimeString) as DataMap;
        return ShowtimeModel.fromMap(showtimeMap);
      } else {
        return Future.value();
      }
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> clearCachedShowtime() async {
    try {
      await _prefs.remove('selectedShowtime');
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
