import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/errors/failures.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/movie/data/datasource/movie_remote_data_source.dart';
import 'package:cinemix_ui/src/movie/domain/entities/movie.dart';
import 'package:cinemix_ui/src/movie/domain/repositories/movie_repository.dart';
import 'package:cinemix_ui/src/movie/domain/usecases/search_movie.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl implements MovieRepository {
  const MovieRepositoryImpl(this._remoteDataSource);

  final MovieRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<List<Movie>> searchMovie(MovieSearchParams params) async {
    try {
      final result = await _remoteDataSource.search(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<Movie> getMovieById(int id) async {
    try {
      final result = await _remoteDataSource.getMovieById(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
