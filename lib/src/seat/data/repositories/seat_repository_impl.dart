import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/errors/failures.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/seat/data/datasource/seat_local_data_source.dart';
import 'package:cinemix_ui/src/seat/data/models/seat_model.dart';
import 'package:cinemix_ui/src/seat/domain/entities/seat.dart';
import 'package:cinemix_ui/src/seat/domain/repositories/seat_repository.dart';
import 'package:dartz/dartz.dart';

class SeatRepositoryImpl implements SeatRepository {
  const SeatRepositoryImpl(this._localDataSource);

  final SeatLocalDataSource _localDataSource;

  @override
  VoidFuture cacheSelectedSeats(List<Seat> seats) async {
    try {
      final result =
          await _localDataSource.cacheSelectedSeats(seats as List<SeatModel>);
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  VoidFuture removeSelectedSeats(List<Seat> seats) async {
    try {
      final result =
          await _localDataSource.removeSelectedSeat(seats as List<SeatModel>);
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<List<Seat>> getSelectedSeats() async {
    try {
      final selectedSeats = await _localDataSource.getSelectedSeats();
      return Right(selectedSeats);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  VoidFuture clearCachedSeats() async {
    try {
      await _localDataSource.clearCachedSeats();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
