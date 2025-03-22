import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/asset_icon_manager.dart';
import 'package:ecommerce_app/core/utils/asset_image_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomOfCompleteOrCancelTask extends StatelessWidget {
  const CustomOfCompleteOrCancelTask({
    super.key,
    this.isComplete = false,
  });
  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceWidthHeight.perentageOfHeight(HeightManager.h108),
      child: Row(
        children: [
          Container(
            height: DeviceWidthHeight.perentageOfHeight(HeightManager.h108),
            width: DeviceWidthHeight.perentageOfWidth(WidthManager.w72),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                RaduisManager.r20,
              ),
            ),
            child: Image.asset(
              AssetImageManager.activeorder,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: WidthManager.w12,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Fruit and Berry Tea",
                          style: TextStyleManager.meduim(
                            size: TextSizeManager.s20,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "\$20.00",
                          style: TextStyleManager.meduim(
                            size: TextSizeManager.s20,
                            color: ColorManager.secondaryColor,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "29 Nov, 01:20 pm",
                      style: TextStyleManager.light(
                        size: TextSizeManager.s14,
                      ),
                    ),
                    Text(
                      "2 items",
                      style: TextStyleManager.light(
                        size: TextSizeManager.s14,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      isComplete
                          ? AssetIconManager.ordercomplete
                          : AssetIconManager.ordercancel,
                      fit: BoxFit.scaleDown,
                    ),
                    SizedBox(width: WidthManager.w5),
                    Text(
                      isComplete ? "Order delivered" : "Order cancelled",
                      style: TextStyleManager.light(
                        size: TextSizeManager.s14,
                        color: ColorManager.secondaryColor,
                        height: 1,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
