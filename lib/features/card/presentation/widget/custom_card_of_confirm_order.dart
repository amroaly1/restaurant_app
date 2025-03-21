import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/asset_image_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class CustomCardOfConfirmOrder extends StatelessWidget {
  const CustomCardOfConfirmOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceWidthHeight.perentageOfHeight(
        HeightManager.h80,
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: DeviceWidthHeight.perentageOfHeight(
              HeightManager.h80,
            ),
            width: DeviceWidthHeight.perentageOfWidth(
              WidthManager.w98,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                RaduisManager.r20,
              ),
            ),
            child: Image.asset(
              AssetImageManager.cardtest,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: WidthManager.w12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Strawberry Shake",
                  style: TextStyleManager.meduim(
                    size: TextSizeManager.s20,
                  ),
                ),
                SizedBox(
                  height: HeightManager.h5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "1 items",
                      style: TextStyleManager.light(
                        size: TextSizeManager.s14,
                        color: ColorManager.greyColor,
                      ),
                    ),
                    Text(
                      "\$20.00",
                      style: TextStyleManager.meduim(
                        size: TextSizeManager.s20,
                        color: ColorManager.secondaryColor,
                      ),
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
