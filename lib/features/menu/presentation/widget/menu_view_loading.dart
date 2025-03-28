import 'package:ecommerce_app/core/helper/device_width_height.dart';

import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class MenuViewLoading extends StatelessWidget {
  const MenuViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: HeightManager.h26,
        ),
        SizedBox(
          height: DeviceWidthHeight.perentageOfHeight(HeightManager.h108),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: WidthManager.w5,
                ),
                child: Column(
                  children: [
                    Shimmer.fromColors(
                      baseColor: ColorManager.greyColor,
                      highlightColor: ColorManager.secondaryColor,
                      child: Container(
                        height: DeviceWidthHeight.perentageOfHeight(
                            HeightManager.h90),
                        width: DeviceWidthHeight.perentageOfWidth(
                          WidthManager.w60,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.greyColor,
                          borderRadius: BorderRadius.circular(
                            RaduisManager.r30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: HeightManager.h5,
                    ),
                    Shimmer.fromColors(
                      baseColor: ColorManager.greyColor,
                      highlightColor: ColorManager.secondaryColor,
                      child: Container(
                        height: HeightManager.h11,
                        width: WidthManager.w49,
                        color: ColorManager.whiteColor,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: HeightManager.h12,
          ),
          child: Divider(
            color: ColorManager.primaryColor,
          ),
        ),
        Expanded(
          child: Shimmer.fromColors(
            baseColor: ColorManager.greyColor,
            highlightColor: ColorManager.secondaryColor,
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: DeviceWidthHeight.perentageOfHeight(174),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorManager.white1Color,
                        borderRadius: BorderRadius.circular(
                          RaduisManager.r35,
                        ),
                      ),
                    ),
                    SizedBox(height: HeightManager.h10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          spacing: WidthManager.w12,
                          children: [
                            Container(
                              width: WidthManager.w169,
                              height: HeightManager.h27,
                              color: ColorManager.whiteColor,
                            ),
                            Center(
                              child: Container(
                                height: HeightManager.h5,
                                width: WidthManager.w5,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorManager.secondaryColor,
                                ),
                              ),
                            ),
                            Container(
                              width: WidthManager.w34,
                              height: HeightManager.h14,
                              padding: EdgeInsets.only(
                                left: WidthManager.w5,
                                right: WidthManager.w5,
                                top: HeightManager.h3,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorManager.whiteColor,
                                borderRadius: BorderRadius.circular(
                                  RaduisManager.r30,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: WidthManager.w52,
                          height: HeightManager.h17,
                          color: ColorManager.whiteColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: HeightManager.h10,
                    ),
                    Container(
                      width: WidthManager.w127,
                      height: HeightManager.h11,
                      color: ColorManager.whiteColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: HeightManager.h12,
                      ),
                      child: Divider(
                        color: ColorManager.primaryColor,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
