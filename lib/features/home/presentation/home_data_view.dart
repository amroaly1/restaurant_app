import 'package:ecommerce_app/core/helper/arrow_direction.dart';
import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/utils/asset_image_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/custom_indicator.dart';
import 'package:ecommerce_app/core/widget/custom_search_and_card_shooping.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/features/home/presentation/widget/custom_card_of_best_seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeDataView extends StatelessWidget {
  const HomeDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: PaddingManager.paddingHorizontalBody,
            child: SizedBox(
              height: DeviceWidthHeight.perentageOfHeight(HeightManager.h180),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSearchAndCardShooping(
                    onChanged: (p0) {},
                  ),
                  SizedBox(height: HeightManager.h16),
                  Text(
                    LanguageGlobaleVar.goodMorning.tr,
                    style: TextStyleManager.bold(
                      size: TextSizeManager.s30,
                      color: ColorManager.white1Color,
                      height: 0,
                    ),
                  ),
                  Text(
                    LanguageGlobaleVar.riseandshine.tr,
                    style: TextStyleManager.meduim(
                      size: TextSizeManager.s13,
                      color: ColorManager.secondaryColor,
                    ),
                  ),
                  SizedBox(height: HeightManager.h17),
                ],
              ),
            ),
          ),
          Expanded(
            child: CustomWhiteBackground(
              child: Padding(
                padding: PaddingManager.paddingHorizontalBody,
                child: Column(
                  children: [
                    SizedBox(height: HeightManager.h34),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LanguageGlobaleVar.bestSeller,
                          style: TextStyleManager.meduim(
                            size: TextSizeManager.s20,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // go to best seller
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Center(
                                child: Text(
                                  LanguageGlobaleVar.viewAll.tr,
                                  style: TextStyleManager.semiBoald(
                                    size: TextSizeManager.s12,
                                    color: ColorManager.secondaryColor,
                                    height: 0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: WidthManager.w7,
                              ),
                              SvgPicture.asset(
                                ArrowDirection.arrowDirectionEnRight(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: HeightManager.h10),
                    ListOfBestSeller(),
                    SizedBox(height: HeightManager.h20),
                    Column(
                      children: [
                        SizedBox(
                          height: DeviceWidthHeight.perentageOfHeight(128),
                          child: PageView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                // width: DeviceWidthHeight.perentageOfWidth(323),
                                width: double.infinity,
                                height:
                                    DeviceWidthHeight.perentageOfHeight(128),
                                child: Stack(
                                  children: [
                                    SvgPicture.asset(
                                      AssetImageManager.sliderBackdround,
                                      fit: BoxFit.fill,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        CustomIndicator(itemCount: 5, currentIndex: 0),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
