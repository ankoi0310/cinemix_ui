import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/errors/failures.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/seat/data/datasouce/ticket_price_local_data_source.dart';
import 'package:cinemix_ui/src/seat/domain/repositories/ticket_price_repository.dart';
import 'package:cinemix_ui/src/seat/domain/usecases/cache_selected_options.dart';
import 'package:dartz/dartz.dart';

class TicketPriceRepositoryImpl implements TicketPriceRepository {
  const TicketPriceRepositoryImpl(this._localDataSource);

  final TicketPriceLocalDataSource _localDataSource;

  @override
  VoidFuture cacheSelectedOptions(OptionsParams params) async {
    try {
      await _localDataSource.cacheSelectedOptions(
        ticketPriceId: params.ticketPriceId,
        quantity: params.quantity,
      );

      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<Map<int, int>> getSelectedOptions() async {
    try {
      final selectedOptions = await _localDataSource.getSelectedOptions();

      return Right(selectedOptions);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  VoidFuture clearSelectedOptions() async {
    try {
      await _localDataSource.clearSelectedOptions();

      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
