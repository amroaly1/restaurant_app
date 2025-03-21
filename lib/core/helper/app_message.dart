import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppMessage {
  static void showMessage1({
    required String title,
    required String body,
    IconData? icon = Icons.error,
    Color? colorIcon = ColorManager.white1Color,
  }) {
    Get.snackbar(
      title,
      body,
      colorText: ColorManager.primaryColor,
      backgroundColor: ColorManager.secondaryColor,
      icon: Icon(
        icon,
        color: colorIcon,
      ),
    );
  }

  static void showMessage2({
    required String title,
    required String body,
    IconData? icon = Icons.check,
    Color? colorIcon = ColorManager.whiteColor,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        titleText: Text(
          title,
          style: TextStyleManager.regular(
            size: TextSizeManager.s15,
            color: ColorManager.white1Color,
          ),
        ),
        messageText: Text(
          body,
          style: TextStyleManager.regular(
            size: TextSizeManager.s12,
            color: ColorManager.white1Color,
          ),
        ),
        backgroundColor: ColorManager.secondaryColor,
        icon: Icon(
          icon,
          color: colorIcon,
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
