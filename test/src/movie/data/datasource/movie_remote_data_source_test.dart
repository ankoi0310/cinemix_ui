import 'dart:convert';
import 'dart:io';

import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/handler/domain/http_request_filter.dart';
import 'package:cinemix_ui/core/handler/domain/http_response.dart';
import 'package:cinemix_ui/core/shared/constants/app_constant.dart';
import 'package:cinemix_ui/src/movie/data/datasource/movie_remote_data_source.dart';
import 'package:cinemix_ui/src/movie/data/models/movie_model.dart';
import 'package:cinemix_ui/src/movie/domain/usecases/search_movie.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockHttpRequestFilter extends Mock implements HttpRequestFilter {}

void main() {
  late MockHttpRequestFilter filter;
  late MovieRemoteDataSourceImpl dataSource;

  setUp(() {
    filter = MockHttpRequestFilter();
    dataSource = MovieRemoteDataSourceImpl(filter: filter);
  });

  final tMovie = MovieModel.demo();
  final tMovies = <MovieModel>[tMovie];
  const tParams = MovieSearchParams();
  final tHttpResponse = HttpResponse(
    success: true,
    statusCode: 200,
    message: 'message',
    data: tMovies.map((e) => e.toMap()).toList(),
  );
  group('searchMovie', () {
    test(
      'should call the [HttpRequestFilter] to perform a GET request and '
      'return the right response',
      () async {
        // arrange
        when(
          () => filter.makeRequest(
            '${AppConstant.kBaseUrl}/movie/search?${tParams.toQueryString()}',
            'GET',
          ),
        ).thenAnswer(
          (_) async => http.Response(
            jsonEncode(tHttpResponse.toMap()),
            200,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            },
          ),
        );

        // act
        final result = await dataSource.searchMovie(tParams);

        // assert
        expect(result, equals(tMovies));
        verify(
          () => filter.makeRequest(
            '${AppConstant.kBaseUrl}/movie/search?${tParams.toQueryString()}',
            'GET',
          ),
        ).called(1);
        verifyNoMoreInteractions(filter);
      },
    );

    test(
      'should throw a [ServerException] when the call to the '
      'remote data source is unsuccessfull',
      () async {
        // arrange
        when(
          () {
            return filter.makeRequest(
              '${AppConstant.kBaseUrl}/movie/search?${tParams.toQueryString()}',
              'GET',
            );
          },
        ).thenAnswer(
          (_) async => http.Response(
            '[]',
            400,
          ),
        );

        // act
        final call = dataSource.searchMovie(tParams);

        // assert
        expect(call, throwsA(isA<ServerException>()));
      },
    );
  });
}
