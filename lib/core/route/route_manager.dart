import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class RouteManager {
  static void navigateTo(Widget screen) async {
    await Get.to(screen);
  }

  static void backFrom() async {
    Get.back();
  }

  static void navigateToAndNoOptionToBack(Widget screen) async {
    await Get.off(screen);
  }

  static void navigateToAndRemoveAllScreenFromStack(Widget screen) async {
    await Get.offAll(screen);
  }
}
