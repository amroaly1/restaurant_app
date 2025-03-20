import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/widget/custom_search_and_card_shooping.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/features/menu/presentation/widget/custom_category_section.dart';
import 'package:ecommerce_app/features/menu/presentation/widget/custom_list_of_category_item.dart';
import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: DeviceWidthHeight.perentageOfHeight(HeightManager.h116),
          child: Padding(
            padding: PaddingManager.paddingHorizontalBody,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomSearchAndCardShooping(),
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
                  SizedBox(
                    height: HeightManager.h26,
                  ),
                  CustomCategorySection(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: HeightManager.h12,
                    ),
                    child: Divider(
                      color: ColorManager.primaryColor,
                    ),
                  ),
                  CustomListOfCategoryItem()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
