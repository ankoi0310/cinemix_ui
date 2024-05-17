import 'dart:convert';

import 'package:cinemix_ui/core/errors/exceptions.dart';
import 'package:cinemix_ui/core/handler/domain/http_request_filter.dart';
import 'package:cinemix_ui/core/handler/domain/http_response.dart';
import 'package:cinemix_ui/core/shared/constants/app_constant.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/authentication/data/data_sources/authentication_local_data_source.dart';
import 'package:cinemix_ui/src/invoice/data/models/invoice_model.dart';
import 'package:cinemix_ui/src/user/data/models/user_profile.dart';
import 'package:flutter/cupertino.dart';

abstract class UserRemoteDataSource {
  const UserRemoteDataSource();

  Future<UserProfile> getUserProfile();
  Future<UserProfile> updateUserProfile(UserProfileRequest request);
  Future<List<InvoiceModel>> getBookingHistory();
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  const UserRemoteDataSourceImpl({
    required AuthenticationLocalDataSource localDataSource,
    required HttpRequestFilter filter,
  })  : _localDataSource = localDataSource,
        _filter = filter;

  final AuthenticationLocalDataSource _localDataSource;
  final HttpRequestFilter _filter;

  @override
  Future<UserProfile> getUserProfile() async {
    try {
      final signInInfo = await _localDataSource.getSignInInfo();
      final response = await _filter.makeRequest(
        '${AppConstant.kBaseUrl}/user/profile',
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

      final userProfile = UserProfile.fromMap(httpResponse.data as DataMap);

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
      final signInInfo = await _localDataSource.getSignInInfo();
      final response = await _filter.makeRequest(
        '${AppConstant.kBaseUrl}/user/profile',
        'PUT',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${signInInfo.accessToken}',
        },
        body: jsonEncode(request.toMap()),
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

      final userProfile = UserProfile.fromMap(httpResponse.data as DataMap);

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
  Future<List<InvoiceModel>> getBookingHistory() async {
    try {
      final signInInfo = await _localDataSource.getSignInInfo();
      final response = await _filter.makeRequest(
        '${AppConstant.kBaseUrl}/user/booking-history',
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

      final invoices = (httpResponse.data as List)
          .map((e) => InvoiceModel.fromMap(e as DataMap))
          .toList();

      return invoices;
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
