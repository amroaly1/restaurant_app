import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/features/menu/data/model/category_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CustomCardCategory extends StatelessWidget {
  const CustomCardCategory({
    super.key,
    required this.isActive,
    required this.categoryModel,
  });
  final bool isActive;
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: DeviceWidthHeight.perentageOfWidth(
              WidthManager.w49,
            ),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              color: isActive
                  ? ColorManager.primaryColor
                  : ColorManager.yellowColor,
              borderRadius: BorderRadius.circular(
                RaduisManager.r30,
              ),
            ),
            child: FancyShimmerImage(
              shimmerBaseColor: ColorManager.greyColor,
              shimmerHighlightColor: ColorManager.secondaryColor,
              height: DeviceWidthHeight.perentageOfHeight(HeightManager.h44),
              boxFit: BoxFit.fill,
              imageUrl: categoryModel.imagePath,
            )),
        Text(
          categoryModel.title,
          style: TextStyleManager.regular(size: TextSizeManager.s12),
        )
      ],
    );
  }
}
