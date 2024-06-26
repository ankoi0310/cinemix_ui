import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/errors/failures.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/booking/data/datasource/booking_remote_data_source.dart';
import 'package:cinemix_ui/src/booking/data/models/booking_request.dart';
import 'package:cinemix_ui/src/booking/data/models/payos_model.dart';
import 'package:cinemix_ui/src/booking/domain/repositories/booking_repository.dart';
import 'package:cinemix_ui/src/invoice/domain/entities/invoice.dart';
import 'package:dartz/dartz.dart';

class BookingRepositoryImpl implements BookingRepository {
  const BookingRepositoryImpl(this._remoteDataSource);

  final BookingRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<LinkCreationResponse> createBooking(
    BookingRequest request,
  ) async {
    try {
      final result = await _remoteDataSource.createBooking(request);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<Invoice> cancelBooking(int code) async {
    try {
      final result = await _remoteDataSource.cancelBooking(code);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<Invoice> completePayment(int code) async {
    try {
      final result = await _remoteDataSource.completePayment(code);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
