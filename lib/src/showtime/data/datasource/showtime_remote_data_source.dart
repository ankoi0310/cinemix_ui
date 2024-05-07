import 'dart:convert';

import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/shared/constants/app_constant.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/showtime/data/models/showtime_model.dart';
import 'package:cinemix_ui/src/showtime/domain/usecases/search_showtime.dart';
import 'package:http/http.dart' as http;

abstract class ShowtimeRemoteDataSource {
  const ShowtimeRemoteDataSource();

  Future<List<ShowtimeModel>> search(ShowtimeSearchParams params);
}

class ShowtimeRemoteDataSourceImpl extends ShowtimeRemoteDataSource {
  const ShowtimeRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<List<ShowtimeModel>> search(
    ShowtimeSearchParams params,
  ) async {
    try {
      final query = params.toQueryString();
      final response = await client.get(
        Uri.parse('$kBaseUrl/showtime${query.isNotEmpty ? '?$query' : ''}'),
      );

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      final httpResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as DataMap;

      return (httpResponse['data'] as List)
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
