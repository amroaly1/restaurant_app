import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:flutter/material.dart';

class CustomIconAddOrRemove extends StatelessWidget {
  const CustomIconAddOrRemove(
      {super.key, required this.icon, this.onTap, this.isActive = false});
  final IconData icon;
  final void Function()? onTap;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: HeightManager.h26,
        width: WidthManager.w26,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive
              ? ColorManager.secondaryColor
              : ColorManager.lightOrangeColor,
        ),
        child: Icon(
          icon,
          color: ColorManager.whiteColor,
        ),
      ),
    );
  }
}
