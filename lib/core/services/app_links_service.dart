import 'package:app_links/app_links.dart';
import 'package:cinemix_ui/core/shared/utils/context_util.dart';
import 'package:cinemix_ui/src/booking/presentation/views'
    '/checkout_failed_screen.dart';
import 'package:cinemix_ui/src/booking/presentation/views'
    '/checkout_success_screen.dart';
import 'package:flutter/material.dart';

class AppLinksService {
  static Future<void> init() async {
    final appLinks = AppLinks();
    appLinks.uriLinkStream.listen(_uriHandler);
    print('AppLinksService initialized');
  }

  static void _uriHandler(Uri? uri) {
    print('Received uri: $uri');

    if (uri == null ||
        uri.pathSegments.isEmpty ||
        uri.pathSegments.first.isEmpty) {
      return;
    }

    final path = uri.pathSegments.first;

    print('Path: $path');

    switch (path) {
      case 'checkout-cancel':
        Navigator.pushNamed(
          ContextUtil.context,
          CheckoutFailedScreen.routeName,
        );
        return;
      case 'checkout-success':
        Navigator.pushNamed(
          ContextUtil.context,
          CheckoutSuccessScreen.routeName,
          arguments: uri.queryParameters['orderCode'],
        );
        return;
    }
  }
}
