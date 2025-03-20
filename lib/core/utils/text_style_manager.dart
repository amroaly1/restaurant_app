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
          Color color = ColorManager.black1Color,
          double? height}) =>
      TextStyle(
        fontWeight: FontWeightManager.meduim,
        fontFamily: fontfamily,
        fontSize: size,
        color: color,
        height: height,
      );
  static TextStyle semiBoald(
          {String? fontfamily,
          required double size,
          Color color = ColorManager.black1Color,
          double? height}) =>
      TextStyle(
        fontWeight: FontWeightManager.semiBold,
        fontFamily: fontfamily,
        fontSize: size,
        color: color,
        height: height,
      );
  static TextStyle extraBold(
          {String? fontfamily,
          required double size,
          Color color = ColorManager.black1Color}) =>
      TextStyle(
        fontWeight: FontWeightManager.extraBold,
        fontFamily: fontfamily,
        fontSize: size,
        color: color,
      );
  static TextStyle bold(
          {String? fontfamily,
          required double size,
          Color color = ColorManager.black1Color,
          double? height}) =>
      TextStyle(
        fontWeight: FontWeightManager.bold,
        fontFamily: fontfamily,
        fontSize: size,
        color: color,
        height: height,
      );
  static TextStyle thin(
          {String? fontfamily,
          required double size,
          Color color = ColorManager.black1Color,
          TextOverflow? overFow}) =>
      TextStyle(
        fontWeight: FontWeightManager.thin,
        fontFamily: fontfamily,
        fontSize: size,
        color: color,
        overflow: overFow,
      );
  static TextStyle regular({
    String? fontfamily,
    required double size,
    Color color = ColorManager.black1Color,
    double? height,
  }) =>
      TextStyle(
        fontWeight: FontWeightManager.regular,
        fontFamily: fontfamily,
        fontSize: size,
        color: color,
        height: height,
      );
  static TextStyle light({
    String? fontfamily,
    required double size,
    Color color = ColorManager.black1Color,
  }) =>
      TextStyle(
        fontWeight: FontWeightManager.light,
        fontFamily: fontfamily,
        fontSize: size,
        color: color,
      );
}
