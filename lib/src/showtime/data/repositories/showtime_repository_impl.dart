import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/errors/failures.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/showtime/data/datasource/showtime_local_data_source.dart';
import 'package:cinemix_ui/src/showtime/data/datasource/showtime_remote_data_source.dart';
import 'package:cinemix_ui/src/showtime/data/models/showtime_model.dart';
import 'package:cinemix_ui/src/showtime/domain/entities/showtime.dart';
import 'package:cinemix_ui/src/showtime/domain/repositories/showtime_repository.dart';
import 'package:cinemix_ui/src/showtime/domain/usecases/search_showtime.dart';
import 'package:dartz/dartz.dart';

class ShowtimeRepositoryImpl implements ShowtimeRepository {
  const ShowtimeRepositoryImpl(this._remoteDataSource, this._localDataSource);

  final ShowtimeRemoteDataSource _remoteDataSource;
  final ShowtimeLocalDataSource _localDataSource;

  @override
  ResultFuture<List<Showtime>> search(ShowtimeSearchParams params) async {
    try {
      final result = await _remoteDataSource.search(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  VoidFuture cacheSelectedShowtime(Showtime params) async {
    try {
      await _localDataSource.cacheSelectedShowtime(params as ShowtimeModel);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<Showtime?> getSelectedShowtime() async {
    try {
      final selectedShowtime = await _localDataSource.getSelectedShowtime();
      return Right(selectedShowtime);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  VoidFuture clearCachedShowtime() async {
    try {
      await _localDataSource.clearCachedShowtime();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
