import 'dart:convert';

import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TicketPriceLocalDataSource {
  const TicketPriceLocalDataSource();

  Future<void> cacheSelectedOptions({
    required int ticketPriceId,
    required int quantity,
  });

  Future<Map<int, int>> getSelectedOptions();

  Future<void> clearCachedOptions();
}

class TicketPriceLocalDataSourceImpl implements TicketPriceLocalDataSource {
  const TicketPriceLocalDataSourceImpl(this._prefs);

  final SharedPreferences _prefs;

  @override
  Future<void> cacheSelectedOptions({
    required int ticketPriceId,
    required int quantity,
  }) async {
    try {
      final options = await getSelectedOptions();

      // Remove the option if the quantity is 0
      if (options.containsKey(ticketPriceId) && quantity == 0) {
        options.remove(ticketPriceId);
      } else if (quantity != 0) {
        // Add the option if the quantity is not 0
        options[ticketPriceId] = quantity;
      } else {
        // Do nothing if the quantity is 0
        return;
      }

      final optionsString = jsonEncode(
          options.map((key, value) => MapEntry(key.toString(), value)));
      await _prefs.setString('selected_options', optionsString);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<Map<int, int>> getSelectedOptions() async {
    try {
      final optionsString = _prefs.getString('selected_options');
      if (optionsString != null) {
        final options = jsonDecode(optionsString) as DataMap;
        return options
            .map((key, value) => MapEntry(int.parse(key), value as int));
      } else {
        return Future.value({});
      }
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> clearCachedOptions() {
    try {
      return _prefs.remove('selected_options');
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
