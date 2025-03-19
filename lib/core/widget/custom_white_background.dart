import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:flutter/material.dart';

class CustomWhiteBackground extends StatelessWidget {
  const CustomWhiteBackground({super.key, this.height, this.child});
  final double? height;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: DeviceWidthHeight.width,
      decoration: BoxDecoration(
        color: ColorManager.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: topRaduis(),
          topRight: topRaduis(),
        ),
      ),
      child: child,
    );
  }

  Radius topRaduis() => Radius.circular(RaduisManager.r20);
}
