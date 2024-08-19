import 'package:bhutanhub/core/store/token.store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteAuthMiddleware {
  RouteAuthMiddleware({
    required this.userStore,
  });

  final TokenStore userStore;

  Future<void> redirect({
    required BuildContext context,
    required void Function() onRedirect,
  }) async {
    final token = await userStore.getToken();
    if (token == null) {
      Future.delayed(
        const Duration(seconds: 2),
        () => Get.snackbar('Tips', 'Login expired, please login again!'),
      );
      // Use the callback to perform navigation instead of using BuildContext directly
      onRedirect();
    }
  }
}
