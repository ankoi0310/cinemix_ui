import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/errors/failures.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/invoice/domain/entities/invoice.dart';
import 'package:cinemix_ui/src/user/data/datasource/user_remote_data_source.dart';
import 'package:cinemix_ui/src/user/data/models/user_profile.dart';
import 'package:cinemix_ui/src/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this._remoteDataSource);

  final UserRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<UserProfile> getProfile() async {
    try {
      final result = await _remoteDataSource.getUserProfile();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<UserProfile> updateProfile(UserProfileRequest params) async {
    try {
      final result = await _remoteDataSource.updateUserProfile(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Invoice>> getBookingHistory() async {
    try {
      final result = await _remoteDataSource.getBookingHistory();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
