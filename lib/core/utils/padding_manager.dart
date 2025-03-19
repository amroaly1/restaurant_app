import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:flutter/cupertino.dart';

abstract class PaddingManager {
  static const EdgeInsetsGeometry authBodyPadding = EdgeInsets.symmetric(
      horizontal: WidthManager.w36, vertical: HeightManager.h34);
  static const EdgeInsetsGeometry textFormFieldPadding = EdgeInsets.symmetric(
      horizontal: WidthManager.w15, vertical: HeightManager.h10);
}
