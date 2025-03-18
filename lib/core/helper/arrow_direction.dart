import 'package:ecommerce_app/core/utils/asset_icon_manager.dart';
import 'package:get/get.dart';

abstract class ArrowDirection {
  static String arrowDirectionEnRight() {
    return Get.locale!.languageCode == "ar"
        ? AssetIconManager.arrowLeft
        : AssetIconManager.arrowRight;
  }

  static String arrowDirectionEnLeft() {
    return Get.locale!.languageCode == "ar"
        ? AssetIconManager.arrowRight
        : AssetIconManager.arrowLeft;
  }
}
