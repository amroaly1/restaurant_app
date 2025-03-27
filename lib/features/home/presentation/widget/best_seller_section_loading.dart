import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BestSellerSectionLoading extends StatelessWidget {
  const BestSellerSectionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceWidthHeight.perentageOfHeight(
        HeightManager.h108,
      ),
      child: Shimmer.fromColors(
        baseColor: ColorManager.greyColor,
        highlightColor: ColorManager.secondaryColor,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsetsDirectional.only(
                end: WidthManager.w12,
              ),
              child: Container(
                width: DeviceWidthHeight.perentageOfWidth(
                  WidthManager.w72,
                ),
                height: DeviceWidthHeight.perentageOfHeight(
                  HeightManager.h108,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.greyColor,
                  borderRadius: BorderRadius.circular(RaduisManager.r20),
                ),
                child: Center(
                  child: Text(
                    "\$priceffffffffffffff",
                    style: TextStyleManager.regular(
                      size: TextSizeManager.s12,
                      color: ColorManager.green,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            );
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
