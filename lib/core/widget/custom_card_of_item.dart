import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/asset_icon_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/font_family_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/features/home/data/model/product_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCardOfItem extends StatelessWidget {
  const CustomCardOfItem({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          height: DeviceWidthHeight.perentageOfHeight(174),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              RaduisManager.r35,
            ),
          ),
          child: FancyShimmerImage(
            shimmerBaseColor: ColorManager.greyColor,
            shimmerHighlightColor: ColorManager.secondaryColor,
            boxFit: BoxFit.fill,
            imageUrl: product.imagePath,
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
                Text(
                  product.name,
                  style: TextStyleManager.semiBoald(
                    size: TextSizeManager.s18,
                    fontfamily: FontFamilyManager.poppins,
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
                        product.rating.toString(),
                        style: TextStyleManager.regular(
                          size: TextSizeManager.s16,
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
                          height: HeightManager.h12,
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Text(
              "\$${product.price}",
              style: TextStyleManager.regular(
                size: TextSizeManager.s18,
                color: ColorManager.secondaryColor,
              ),
            )
          ],
        ),
        Text(
          product.description,
          style: TextStyleManager.light(
            size: TextSizeManager.s12,
          ),
        )
      ],
    );
  }
}
