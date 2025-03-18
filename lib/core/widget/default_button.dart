import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {super.key,
      this.textColor = ColorManager.whiteColor,
      this.backgroundColor = ColorManager.secondaryColor,
      this.onPressed,
      required this.text});
  final void Function()? onPressed;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DeviceWidthHeight.perentageOfWidth(WidthManager.w207),
      height: DeviceWidthHeight.perentageOfHeight(HeightManager.h50),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              RaduisManager.r20,
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyleManager.meduim(
              size: TextSizeManager.s24, color: textColor),
        ),
      ),
    );
  }
}
