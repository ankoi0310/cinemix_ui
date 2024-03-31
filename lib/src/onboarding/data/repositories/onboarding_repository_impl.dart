import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/errors/failures.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/onboarding/data/datasource/onboarding_local_data_source.dart';
import 'package:cinemix_ui/src/onboarding/domain/repositories/onbroading_repository.dart';
import 'package:dartz/dartz.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  const OnboardingRepositoryImpl(this._localDataSource);

  final OnboardingLocalDataSource _localDataSource;

  @override
  ResultFuture<void> cacheFirstTime() async {
    try {
      await _localDataSource.cacheFirstTime();

      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<bool> isFirstTime() async {
    try {
      final isFirstTime = await _localDataSource.isFirstTime();

      return Right(isFirstTime);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
