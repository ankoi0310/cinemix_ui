import 'dart:convert';

import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/handler/domain/http_request_filter.dart';
import 'package:cinemix_ui/core/handler/domain/http_response.dart';
import 'package:cinemix_ui/core/shared/constants/app_constant.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/showtime/data/models/showtime_model.dart';
import 'package:cinemix_ui/src/showtime/domain/usecases/search_showtime.dart';

abstract class ShowtimeRemoteDataSource {
  const ShowtimeRemoteDataSource();

  Future<List<ShowtimeModel>> search(ShowtimeSearchParams params);
}

class ShowtimeRemoteDataSourceImpl extends ShowtimeRemoteDataSource {
  const ShowtimeRemoteDataSourceImpl({
    required HttpRequestFilter filter,
  }) : _filter = filter;

  final HttpRequestFilter _filter;

  @override
  Future<List<ShowtimeModel>> search(
    ShowtimeSearchParams params,
  ) async {
    try {
      final query = params.toQueryString();
      final response = await _filter.makeRequest(
        '${AppConstant.kBaseUrl}/showtime${query.isNotEmpty ? '?$query' : ''}',
        'GET',
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

      return (httpResponse.data as List)
          .map((e) => ShowtimeModel.fromMap(e as DataMap))
          .toList();
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
