import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/errors/failures.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/authentication/data/data_sources/authentication_local_data_source.dart';
import 'package:cinemix_ui/src/authentication/data/data_sources/authentication_remote_data_source.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_in_response.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_up_response.dart';
import 'package:cinemix_ui/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/sign_in.dart';
import 'package:cinemix_ui/src/authentication/domain/usecases/sign_up.dart';
import 'package:dartz/dartz.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  const AuthenticationRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  final AuthenticationRemoteDataSource _remoteDataSource;
  final AuthenticationLocalDataSource _localDataSource;

  @override
  ResultFuture<SignUpResponse> signUp(SignUpParams params) async {
    try {
      final result = await _remoteDataSource.signUp(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  VoidFuture verify(String code) async {
    try {
      final result = await _remoteDataSource.verify(code);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<SignInResponse> signIn(SignInParams params) async {
    try {
      final result = await _remoteDataSource.signIn(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  VoidFuture setSignIn() async {
    try {
      await _localDataSource.setSignIn();

      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<String> getSavedPassword() async {
    try {
      final savedPassword = await _localDataSource.getSavedPassword();

      return Right(savedPassword);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<bool> isSavePassword() async {
    try {
      final isSavePassword = await _localDataSource.isSavePassword();

      return Right(isSavePassword);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<bool> isSignedIn() async {
    try {
      final isSignedIn = await _localDataSource.isSignedIn();

      return Right(isSignedIn);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  VoidFuture removeSavedPassword() async {
    try {
      await _localDataSource.removeSavedPassword();

      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  VoidFuture savePassword(String password) async {
    try {
      await _localDataSource.savePassword(password);

      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  VoidFuture setSavePassword({required bool value}) async {
    try {
      await _localDataSource.setSavePassword(value: value);

      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  VoidFuture signOut() async {
    try {
      await _localDataSource.signOut();

      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
