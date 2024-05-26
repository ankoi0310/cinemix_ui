import 'dart:convert';

import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/handler/domain/http_request_filter.dart';
import 'package:cinemix_ui/core/handler/domain/http_response.dart';
import 'package:cinemix_ui/core/shared/constants/app_constant.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/movie/data/models/movie_model.dart';
import 'package:cinemix_ui/src/movie/domain/usecases/search_movie.dart';

abstract class MovieRemoteDataSource {
  const MovieRemoteDataSource();

  Future<List<MovieModel>> searchMovie(MovieSearchParams params);
  Future<MovieModel> getMovieById(int id);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  const MovieRemoteDataSourceImpl({
    required HttpRequestFilter filter,
  }) : _filter = filter;

  final HttpRequestFilter _filter;

  @override
  Future<List<MovieModel>> searchMovie(MovieSearchParams params) async {
    try {
      // 12. The application converts param to a query string
      final query = params.toQueryString();

      // 13. The application sends a request to the server with the query string
      final response = await _filter.makeRequest(
        '${AppConstant.kBaseUrl}/movie/search?$query',
        'GET',
      );

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      // 14. The server response the result: success, statusCode, message, data
      final httpResponse = HttpResponse.fromMap(
        jsonDecode(utf8.decode(response.bodyBytes)) as DataMap,
      );

      return (httpResponse.data as List)
          .map((e) => MovieModel.fromMap(e as DataMap))
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

  @override
  Future<MovieModel> getMovieById(int id) async {
    try {
      final response = await _filter.makeRequest(
        '${AppConstant.kBaseUrl}/movie/$id',
        'GET',
      );

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      final httpResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as DataMap;

      return MovieModel.fromMap(httpResponse['data'] as DataMap);
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
