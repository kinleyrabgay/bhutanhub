import 'package:bhutanhub/core/constants/colors.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';

class LoadingHelper {
  LoadingHelper._();

  static void showLoading() {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(
        backgroundColor: BHColors.primary,
        color: BHColors.white,
      ),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
  }

  static void dismissLoading() {
    EasyLoading.dismiss();
  }
}
