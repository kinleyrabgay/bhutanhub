import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/utils/helpers/helper.function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Loader {
  Loader._();

  static customToast(BuildContext context, {required message}) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          elevation: 0,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.transparent,
          content: Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: BHHelperFunctions.isDarkMode(context)
                  ? BHColors.darkerGrey.withOpacity(0.4)
                  : BHColors.grey.withOpacity(0.9),
            ),
            child: Center(
                child: Text(
              message,
              style: Theme.of(context).textTheme.labelLarge,
            )),
          ),
        ),
      );
  }

  static infoSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      "Tips",
      "Login expired, please login again!",
      // snackPosition: SnackPosition.BOTTOM,
    );
  }

  static successSnackBar({
    required title,
    message = '',
    duration = 2,
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: BHColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(12),
      icon: const Icon(
        Iconsax.tick_circle,
        color: BHColors.white,
      ),
    );
  }

  static warningSnackBar({
    required title,
    message = '',
    duration = 3,
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(12),
      icon: const Icon(
        Iconsax.warning_2,
        color: BHColors.white,
      ),
    );
  }

  static errorSnackBar({
    required title,
    message = '',
    duration = 3,
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(12),
      icon: const Icon(
        Iconsax.warning_2,
        color: BHColors.white,
      ),
    );
  }
}
