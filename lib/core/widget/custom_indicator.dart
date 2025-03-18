import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator(
      {super.key, required this.itemCount, required this.currentIndex});
  final int itemCount;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: WidthManager.w4,
      children: List.generate(
        itemCount,
        (index) => CustomItemIndicator(
          isActive: currentIndex == index,
        ),
      ),
    );
    // return SizedBox(
    //   height: HeightManager.h4,
    //   width: double.infinity,
    //   child: ListView.separated(
    //       shrinkWrap: true,
    //       scrollDirection: Axis.horizontal,
    //       itemBuilder: (context, index) {
    //         return CustomItemIndicator(
    //           isActive: currentIndex == index,
    //         );
    //       },
    //       separatorBuilder: (context, index) {
    //         return SizedBox(width: WidthManager.w4);
    //       },
    //       itemCount: itemCount),
    // );
  }
}

class CustomItemIndicator extends StatelessWidget {
  const CustomItemIndicator({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 750),
      width: DeviceWidthHeight.perentageOfWidth(WidthManager.w20),
      height: DeviceWidthHeight.perentageOfHeight(HeightManager.h4),
      decoration: BoxDecoration(
        color:
            isActive ? ColorManager.secondaryColor : ColorManager.yellowColor,
        borderRadius: BorderRadius.circular(RaduisManager.r12),
      ),
    );
  }
}
