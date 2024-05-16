import 'dart:convert';

import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/shared/constants/app_constant.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/user/data/models/user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  const UserRemoteDataSource();

  Future<UserProfile> getUserProfile();
  Future<UserProfile> updateUserProfile(UserProfileRequest request);
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  const UserRemoteDataSourceImpl({
    required http.Client client,
  }) : _client = client;

  final http.Client _client;

  @override
  Future<UserProfile> getUserProfile() async {
    try {
      final response = await _client.get(
        Uri.parse('${AppConstant.kBaseUrl}/user/profile'),
      );

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      final map = jsonDecode(utf8.decode(response.bodyBytes)) as DataMap;

      final userProfile = UserProfile.fromMap(map);

      return userProfile;
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
  Future<UserProfile> updateUserProfile(UserProfileRequest request) async {
    try {
      final response = await _client.put(
        Uri.parse('${AppConstant.kBaseUrl}/user/profile'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(request.toMap()),
      );

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      final map = jsonDecode(utf8.decode(response.bodyBytes)) as DataMap;

      final userProfile = UserProfile.fromMap(map);

      return userProfile;
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
