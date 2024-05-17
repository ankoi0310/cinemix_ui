import 'dart:convert';

import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/handler/domain/http_response.dart';
import 'package:cinemix_ui/core/shared/constants/app_constant.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/authentication/data/data_sources/authentication_local_data_source.dart';
import 'package:cinemix_ui/src/authentication/data/models/refresh_token_model.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_in_model.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_up_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationRemoteDataSource {
  const AuthenticationRemoteDataSource();

  Future<SignUpResponse> signUp(SignUpRequest params);

  Future<void> verify(String code);

  Future<SignInInfo> signIn(SignInRequest params);

  Future<String> refreshToken();
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  const AuthenticationRemoteDataSourceImpl({
    required http.Client client,
    required AuthenticationLocalDataSource localDataSource,
  })  : _client = client,
        _localDataSource = localDataSource;

  final http.Client _client;
  final AuthenticationLocalDataSource _localDataSource;

  @override
  Future<SignUpResponse> signUp(SignUpRequest params) async {
    try {
      final response = await _client.post(
        Uri.parse('${AppConstant.kBaseUrl}/auth/register'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(params.toMap()),
      );

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      final map = jsonDecode(utf8.decode(response.bodyBytes)) as DataMap;

      final httpResponse = HttpResponse.fromMap(map);

      final signUpResponse =
          SignUpResponse.fromMap(httpResponse.data as DataMap);

      return signUpResponse;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.toString(),
        statusCode: 500,
      );
    }
  }

  @override
  Future<void> verify(String code) async {
    try {
      final response = await _client.post(
        Uri.parse('${AppConstant.kBaseUrl}/auth/verify?code=$code'),
      );

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.toString(),
        statusCode: 500,
      );
    }
  }

  @override
  Future<SignInInfo> signIn(SignInRequest params) async {
    try {
      final response = await _client.post(
        Uri.parse('${AppConstant.kBaseUrl}/auth/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(params.toMap()),
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

      final signInResponse = SignInInfo.fromMap(
        httpResponse.data as DataMap,
      );

      return signInResponse;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.toString(),
        statusCode: 500,
      );
    }
  }

  @override
  Future<String> refreshToken() async {
    var signInInfo = await _localDataSource.getSignInInfo();

    final response = await http.post(
      Uri.parse('${AppConstant.kBaseUrl}/auth/refresh-token'),
      headers: {
        'Authorization': 'Bearer ${signInInfo.refreshToken}',
      },
    );

    if (response.statusCode != 200) {
      throw ServerException(
        message: response.body,
        statusCode: response.statusCode,
      );
    }

    final map = jsonDecode(utf8.decode(response.bodyBytes)) as DataMap;

    final httpResponse = HttpResponse.fromMap(map);

    final refreshTokenResponse =
        RefreshTokenResponse.fromMap(httpResponse.data as DataMap);

    signInInfo = signInInfo.copyWith(
      accessToken: refreshTokenResponse.accessToken,
      refreshToken: refreshTokenResponse.refreshToken,
    );

    await _localDataSource.setSignInInfo(signInInfo);

    return refreshTokenResponse.accessToken;
  }
}
