import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/custom_search_and_card_shooping.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:flutter/material.dart';
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
            child: CustomWhiteBackground(),
          ),
        ],
      ),
    );
  }
}
