import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/asset_icon_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/features/my_orders/data/model/item_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomOfCompleteOrCancelTask extends StatelessWidget {
  const CustomOfCompleteOrCancelTask({
    super.key,
    this.isComplete = false,
    this.onTap,
    required this.item,
    required this.date,
  });
  final bool isComplete;
  final void Function()? onTap;
  final ItemModel item;
  final String date;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceWidthHeight.perentageOfHeight(HeightManager.h108),
      child: Row(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: DeviceWidthHeight.perentageOfHeight(HeightManager.h108),
              width: DeviceWidthHeight.perentageOfWidth(WidthManager.w72),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  RaduisManager.r20,
                ),
              ),
              child: FancyShimmerImage(
                shimmerBaseColor: ColorManager.greyColor,
                shimmerHighlightColor: ColorManager.secondaryColor,
                boxFit: BoxFit.fill,
                imageUrl: item.imagePath,
              ),
            ),
          ),
          SizedBox(
            width: WidthManager.w12,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        item.name,
                        style: TextStyleManager.meduim(
                          size: TextSizeManager.s20,
                        ),
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "\$${item.price}",
                        style: TextStyleManager.meduim(
                          size: TextSizeManager.s20,
                          color: ColorManager.secondaryColor,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: TextStyleManager.light(
                        size: TextSizeManager.s14,
                      ),
                    ),
                    Text(
                      "${item.quantity} items",
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
