import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/errors/failures.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/showtime/data/datasource/showtime_remote_data_source.dart';
import 'package:cinemix_ui/src/showtime/domain/entities/showtime.dart';
import 'package:cinemix_ui/src/showtime/domain/repositories/showtime_repository.dart';
import 'package:cinemix_ui/src/showtime/domain/usecases/search_showtime.dart';
import 'package:dartz/dartz.dart';

class ShowtimeRepositoryImpl implements ShowtimeRepository {
  const ShowtimeRepositoryImpl(this._remoteDataSource);

  final ShowtimeRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<List<Showtime>> search(ShowtimeSearchParams params) async {
    try {
      final result = await _remoteDataSource.search(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
