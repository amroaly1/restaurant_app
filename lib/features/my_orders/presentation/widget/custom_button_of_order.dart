import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class CustomButtonOfOrder extends StatelessWidget {
  const CustomButtonOfOrder({
    super.key,
    required this.title,
    required this.isActive,
    this.textSize = TextSizeManager.s17,
    this.onTap,
  });
  final String title;
  final bool isActive;
  final double textSize;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: DeviceWidthHeight.perentageOfHeight(HeightManager.h28),
        width: DeviceWidthHeight.perentageOfWidth(WidthManager.w104),
        decoration: BoxDecoration(
          color: isActive
              ? ColorManager.secondaryColor
              : ColorManager.lightOrangeColor,
          borderRadius: BorderRadius.circular(RaduisManager.r38),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyleManager.meduim(
              size: textSize,
              color: isActive
                  ? ColorManager.whiteColor
                  : ColorManager.secondaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
