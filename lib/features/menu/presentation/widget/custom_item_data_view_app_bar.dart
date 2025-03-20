import 'package:ecommerce_app/core/helper/arrow_direction.dart';
import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/utils/asset_icon_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomItemDataViewAppBar extends StatelessWidget {
  const CustomItemDataViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceWidthHeight.perentageOfHeight(129),
      child: SafeArea(
        child: Padding(
          padding: PaddingManager.paddingHorizontalBody,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: WidthManager.w20,
                children: [
                  InkWell(
                    onTap: () {
                      RouteManager.backFrom();
                    },
                    child: SvgPicture.asset(
                      ArrowDirection.arrowDirectionEnLeft(),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: HeightManager.h17),
                      Row(
                        spacing: WidthManager.w12,
                        children: [
                          Text(
                            "Mexican appetizer",
                            style: TextStyleManager.meduim(
                              size: TextSizeManager.s20,
                            ),
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
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: WidthManager.w5,
                          right: WidthManager.w5,
                          top: HeightManager.h3,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorManager.secondaryColor,
                          borderRadius: BorderRadius.circular(
                            RaduisManager.r30,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "5.0",
                              style: TextStyleManager.regular(
                                size: TextSizeManager.s12,
                                height: 0,
                                color: ColorManager.whiteColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(width: WidthManager.w4),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: SvgPicture.asset(
                                AssetIconManager.star,
                                height: HeightManager.h8,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(HeightManager.h4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.redColor,
                ),
                child: Icon(
                  Icons.favorite,
                  size: HeightManager.h12,
                  color: ColorManager.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
