import 'package:cinemix_ui/core/shared/utils/typedefs.dart';

class HttpResponse {
  HttpResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory HttpResponse.fromMap(DataMap map) {
    return HttpResponse(
      success: map['success'] as bool,
      statusCode: map['statusCode'] as int,
      message: map['message'] as String,
      data: map['data'],
    );
  }

  final bool success;
  final int statusCode;
  final String message;
  final dynamic data;

  DataMap toMap() {
    return {
      'success': success,
      'statusCode': statusCode,
      'message': message,
      'data': data,
    };
  }
}
