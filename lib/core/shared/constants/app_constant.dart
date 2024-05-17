import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

const kAccessTokenKey = 'accessToken';
const kBaseAvatarUrl = 'https://robohash.org';

class AppConstant {
  static const String appName = 'Cinemix';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Cinemix is a movie ticket booking app';
  static String kBaseUrl = 'http://10.0.2.2:8080/api';

  static Future<void> setBaseUrl() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.isPhysicalDevice) {
        kBaseUrl = 'http://192.168.1.9:8080/api';
      }
    }

    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      if (iosInfo.isPhysicalDevice) {
        kBaseUrl = 'http://192.168.1.9:8080/api';
      }
    }
  }
}
