import 'package:cinemix_ui/src/authentication/data/data_sources/authentication_remote_data_source.dart';
import 'package:http/http.dart' as http;

class HttpRequestFilter {
  const HttpRequestFilter({
    required http.Client client,
    required AuthenticationRemoteDataSource remoteDataSource,
  })  : _client = client,
        _remoteDataSource = remoteDataSource;

  final http.Client _client;
  final AuthenticationRemoteDataSource _remoteDataSource;

  Future<http.Response> makeRequest(
    String url,
    String method, {
    Map<String, String> headers = const {},
    dynamic body,
  }) async {
    late http.Response response;
    switch (method.toUpperCase()) {
      case 'POST':
        response = await _client.post(
          Uri.parse(url),
          headers: headers,
          body: body,
        );
      case 'PUT':
        response = await _client.put(
          Uri.parse(url),
          headers: headers,
          body: body,
        );
      case 'DELETE':
        response = await _client.delete(Uri.parse(url), headers: headers);
      default:
        response = await _client.get(Uri.parse(url), headers: headers);
    }

    if (response.statusCode == 401) {
      final newAccessToken = await _remoteDataSource.refreshToken();

      headers['Authorization'] = 'Bearer $newAccessToken';

      switch (method) {
        case 'POST':
          response = await _client.post(
            Uri.parse(url),
            headers: headers,
            body: body,
          );
        case 'PUT':
          response = await _client.put(
            Uri.parse(url),
            headers: headers,
            body: body,
          );
        case 'DELETE':
          response = await _client.delete(Uri.parse(url), headers: headers);
        default:
          response = await _client.get(Uri.parse(url), headers: headers);
      }
    }

    return response;
  }
}
