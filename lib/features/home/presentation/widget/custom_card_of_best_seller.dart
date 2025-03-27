import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/features/home/data/model/product_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CustomCardOfBestSeller extends StatelessWidget {
  const CustomCardOfBestSeller({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          width: DeviceWidthHeight.perentageOfWidth(
            WidthManager.w72,
          ),
          height: DeviceWidthHeight.perentageOfHeight(
            HeightManager.h108,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RaduisManager.r20),
          ),
          child: FancyShimmerImage(
            shimmerBaseColor: ColorManager.greyColor,
            shimmerHighlightColor: ColorManager.secondaryColor,
            errorWidget: Icon(
              Icons.close,
              color: ColorManager.redColor,
            ),
            imageUrl: product.imagePath,
          ),
        ),
        PositionedDirectional(
          end: 0,
          bottom: HeightManager.h12,
          child: Container(
            padding: EdgeInsetsDirectional.only(
              start: WidthManager.w7,
              end: WidthManager.w4,
            ),
            decoration: BoxDecoration(
              color: ColorManager.secondaryColor,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(RaduisManager.r10),
                bottomStart: Radius.circular(RaduisManager.r10),
              ),
            ),
            child: Text(
              "\$${product.price}",
              style: TextStyleManager.regular(
                size: TextSizeManager.s12,
                color: ColorManager.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ListOfBestSeller extends StatelessWidget {
  const ListOfBestSeller({super.key, required this.data});
  final List<ProductModel> data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceWidthHeight.perentageOfHeight(
        HeightManager.h108,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomCardOfBestSeller(
            product: data[index],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: WidthManager.w12,
        ),
        itemCount: data.length,
      ),
    );
  }
}
