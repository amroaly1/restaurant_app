import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:flutter/cupertino.dart';

abstract class PaddingManager {
  static const double p5 = 5;
  static const double p4 = 4;
  static const EdgeInsetsGeometry authBodyPadding = EdgeInsets.symmetric(
      horizontal: WidthManager.w36, vertical: HeightManager.h34);
  static const EdgeInsetsGeometry paddingHorizontalBody = EdgeInsets.symmetric(
    horizontal: WidthManager.w36,
  );
  static const EdgeInsetsGeometry textFormFieldPadding = EdgeInsets.symmetric(
      horizontal: WidthManager.w15, vertical: HeightManager.h10);
}
