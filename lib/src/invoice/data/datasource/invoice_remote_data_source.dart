import 'dart:convert';

import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/handler/domain/http_request_filter.dart';
import 'package:cinemix_ui/core/handler/domain/http_response.dart';
import 'package:cinemix_ui/core/shared/constants/app_constant.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/authentication/data/data_sources/authentication_local_data_source.dart';
import 'package:cinemix_ui/src/invoice/data/models/invoice_model.dart';

abstract class InvoiceRemoteDataSource {
  const InvoiceRemoteDataSource();

  Future<InvoiceModel> getInvoiceById(int id);
}

class InvoiceRemoteDataSourceImpl implements InvoiceRemoteDataSource {
  const InvoiceRemoteDataSourceImpl({
    required AuthenticationLocalDataSource localDataSource,
    required HttpRequestFilter filter,
  })  : _localDataSource = localDataSource,
        _filter = filter;

  final AuthenticationLocalDataSource _localDataSource;
  final HttpRequestFilter _filter;

  @override
  Future<InvoiceModel> getInvoiceById(int id) async {
    try {
      final signInInfo = await _localDataSource.getSignInInfo();
      final response = await _filter.makeRequest(
        '${AppConstant.kBaseUrl}/invoice/$id',
        'GET',
        headers: {
          'Authorization': 'Bearer ${signInInfo.accessToken}',
        },
      );

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      final httpResponse = HttpResponse.fromMap(
        jsonDecode(utf8.decode(response.bodyBytes)) as DataMap,
      );

      final invoice = InvoiceModel.fromMap(httpResponse.data as DataMap);

      return invoice;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
        statusCode: 500,
      );
    }
  }
}
