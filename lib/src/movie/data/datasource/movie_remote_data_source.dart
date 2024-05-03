import 'dart:convert';

import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/shared/constants/app_constant.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/movie/data/models/movie_model.dart';
import 'package:cinemix_ui/src/movie/domain/usecases/search_movie.dart';
import 'package:http/http.dart' as http;

abstract class MovieRemoteDataSource {
  const MovieRemoteDataSource();

  Future<List<MovieModel>> searchMovie(MovieSearchParams params);
  Future<MovieModel> getMovieById(int id);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  const MovieRemoteDataSourceImpl({
    required http.Client client,
  }) : _client = client;

  final http.Client _client;

  @override
  Future<List<MovieModel>> searchMovie(MovieSearchParams params) async {
    try {
      final query = 'name=${params.name ?? ''}&state=${params.state ?? ''}';
      final response = await _client.get(
        Uri.parse('$kBaseUrl/movie/search?$query'),
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
      final response = await _client.get(Uri.parse('$kBaseUrl/movie/$id'));

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
