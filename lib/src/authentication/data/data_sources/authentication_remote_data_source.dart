import 'dart:convert';

import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/handler/domain/http_response.dart';
import 'package:cinemix_ui/core/shared/constants/app_constant.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_in_model.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_up_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationRemoteDataSource {
  const AuthenticationRemoteDataSource();

  Future<SignUpResponse> signUp(SignUpRequest params);

  Future<void> verify(String code);

  Future<SignInInfo> signIn(SignInRequest params);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  const AuthenticationRemoteDataSourceImpl({
    required http.Client client,
  }) : _client = client;

  final http.Client _client;

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
        body: {
          'username': params.username,
          'password': params.password,
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
}
