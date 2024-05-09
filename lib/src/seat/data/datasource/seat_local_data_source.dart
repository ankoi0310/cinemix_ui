import 'dart:convert';

import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/seat/data/models/seat_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SeatLocalDataSource {
  const SeatLocalDataSource();

  Future<void> cacheSelectedSeats(List<SeatModel> seats);

  Future<void> removeSelectedSeat(List<SeatModel> seats);

  Future<List<SeatModel>> getSelectedSeats();

  Future<void> clearCachedSeats();
}

class SeatLocalDataSourceImpl implements SeatLocalDataSource {
  const SeatLocalDataSourceImpl(this._prefs);

  final SharedPreferences _prefs;

  @override
  Future<void> cacheSelectedSeats(List<SeatModel> seats) async {
    try {
      final seatStrings = _prefs.getStringList('selectedSeats') ?? [];
      final selectedSeats = seatStrings.map(
        (seatString) {
          final seatMap = jsonDecode(seatString) as DataMap;
          return SeatModel.fromMap(seatMap);
        },
      ).toList();
      final newSelectedSeats = [...selectedSeats, ...seats];
      final newSeatStrings =
          newSelectedSeats.map((seat) => jsonEncode(seat.toMap())).toList();
      await _prefs.setStringList('selectedSeats', newSeatStrings);
    } catch (e) {
      throw Exception('Error caching selected seats');
    }
  }

  @override
  Future<void> removeSelectedSeat(List<SeatModel> seats) async {
    try {
      final seatStrings = _prefs.getStringList('selectedSeats');
      if (seatStrings != null) {
        final selectedSeats = seatStrings.map(
          (seatString) {
            final seatMap = jsonDecode(seatString) as DataMap;
            return SeatModel.fromMap(seatMap);
          },
        ).toList();
        final newSelectedSeats = selectedSeats
            .where((selectedSeat) =>
                !seats.any((seat) => seat.name == selectedSeat.name))
            .toList();
        final newSeatStrings =
            newSelectedSeats.map((seat) => jsonEncode(seat.toMap())).toList();
        await _prefs.setStringList('selectedSeats', newSeatStrings);
      }
    } catch (e) {
      throw Exception('Error removing selected seat');
    }
  }

  @override
  Future<List<SeatModel>> getSelectedSeats() async {
    try {
      final seatStrings = _prefs.getStringList('selectedSeats');
      if (seatStrings != null) {
        final seats = seatStrings.map(
          (seatString) {
            final seatMap = jsonDecode(seatString) as DataMap;
            return SeatModel.fromMap(seatMap);
          },
        ).toList();
        return seats;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Error getting selected seats');
    }
  }

  @override
  Future<void> clearCachedSeats() async {
    try {
      await _prefs.remove('selectedSeats');
    } catch (e) {
      throw Exception('Error clearing selected seats');
    }
  }
}
