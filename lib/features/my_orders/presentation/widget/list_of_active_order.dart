import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/asset_image_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/features/my_orders/presentation/widget/custom_button_of_order.dart';
import 'package:flutter/material.dart';

class ListOfActiveOrder extends StatelessWidget {
  const ListOfActiveOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return CustomCardOfActiveOrder();
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: HeightManager.h17),
          child: Divider(
            color: ColorManager.yellowColor,
          ),
        );
      },
      itemCount: 2,
    );
  }
}

class CustomCardOfActiveOrder extends StatelessWidget {
  const CustomCardOfActiveOrder({
    super.key,
  });

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Strawberry shake",
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButtonOfOrder(
                      title: "Cancel Order",
                      isActive: true,
                      textSize: TextSizeManager.s15,
                      onTap: () {
                        // cancel order
                      },
                    ),
                    CustomButtonOfOrder(
                      title: "Track Driver",
                      isActive: false,
                      textSize: TextSizeManager.s15,
                      onTap: () {
                        // track order
                      },
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
