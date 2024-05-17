import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/errors/failures.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/invoice/data/datasource/invoice_remote_data_source.dart';
import 'package:cinemix_ui/src/invoice/data/models/invoice_model.dart';
import 'package:cinemix_ui/src/invoice/domain/repositories/invoice_repository.dart';
import 'package:dartz/dartz.dart';

class InvoiceRepositoryImpl implements InvoiceRepository {
  const InvoiceRepositoryImpl(this._remoteDataSource);

  final InvoiceRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<InvoiceModel> getInvoiceById(int id) async {
    try {
      final result = await _remoteDataSource.getInvoiceById(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
