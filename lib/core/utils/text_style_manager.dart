import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/font_weight_manager.dart';
import 'package:flutter/material.dart';

abstract class TextStyleManager {
  static TextStyle black(
          {String? fontfamily,
          required double size,
          Color color = ColorManager.black1Color}) =>
      TextStyle(
        fontWeight: FontWeightManager.black,
        fontFamily: fontfamily,
        fontSize: size,
        color: color,
      );
  static TextStyle meduim(
          {String? fontfamily,
          required double size,
          Color color = ColorManager.black1Color}) =>
      TextStyle(
        fontWeight: FontWeightManager.meduim,
        fontFamily: fontfamily,
        fontSize: size,
        color: color,
      );
  static TextStyle semiBoald(
          {String? fontfamily,
          required double size,
          Color color = ColorManager.black1Color}) =>
      TextStyle(
        fontWeight: FontWeightManager.semiBold,
        fontFamily: fontfamily,
        fontSize: size,
        color: color,
      );
}
