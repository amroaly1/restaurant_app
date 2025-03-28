import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/manager/carousal_cubit/caroasl_cubit.dart';
import 'package:ecommerce_app/core/manager/carousal_cubit/carosal_state.dart';
import 'package:ecommerce_app/core/utils/asset_image_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/custom_indicator.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CaroaslCubit, CarosalState>(
      builder: (context, state) {
        if (state is CarosalGetDataLoading) {
          return Padding(
            padding: PaddingManager.paddingHorizontalBody,
            child: Center(
                child: SizedBox(
              height: DeviceWidthHeight.perentageOfHeight(HeightManager.h135),
              child: Shimmer.fromColors(
                baseColor: ColorManager.greyColor,
                highlightColor: ColorManager.secondaryColor,
                child: SvgPicture.asset(
                  AssetImageManager.sliderBackdround,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
            )),
          );
        } else if (state is CarosalGetDataFailure) {
          return Padding(
            padding: PaddingManager.paddingHorizontalBody,
            child: SizedBox(
              height: DeviceWidthHeight.perentageOfHeight(HeightManager.h135),
              child: Center(
                child: Text(
                  state.errMessage,
                  style: TextStyleManager.bold(
                      size: TextSizeManager.s18, color: ColorManager.redColor),
                ),
              ),
            ),
          );
        }
        return Column(
          children: [
            SizedBox(
              height: DeviceWidthHeight.perentageOfHeight(HeightManager.h135),
              child: PageView.builder(
                onPageChanged: CaroaslCubit.get(context).onIndexChage,
                controller: CaroaslCubit.get(context).pageController,
                itemCount: CaroaslCubit.get(context).getLenght(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: PaddingManager.paddingHorizontalBody,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          AssetImageManager.sliderBackdround,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                        Positioned.fill(
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: WidthManager.w12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          CaroaslCubit.get(context)
                                              .data[index]
                                              .title,
                                          style: TextStyleManager.regular(
                                            size: TextSizeManager.s16,
                                            color: ColorManager.whiteColor,
                                            height: 2,
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                        ),
                                      ),
                                      Text(
                                        CaroaslCubit.get(context)
                                            .data[index]
                                            .description,
                                        style: TextStyleManager.bold(
                                          size: TextSizeManager.s28,
                                          color: ColorManager.whiteColor,
                                          height: 1,
                                        ),
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadiusDirectional.only(
                                      topEnd: Radius.circular(
                                        RaduisManager.r20,
                                      ),
                                      bottomEnd: Radius.circular(
                                        RaduisManager.r20,
                                      ),
                                    ),
                                  ),
                                  child: FancyShimmerImage(
                                    shimmerBaseColor: ColorManager.greyColor,
                                    shimmerHighlightColor:
                                        ColorManager.secondaryColor,
                                    height: DeviceWidthHeight.perentageOfHeight(
                                        HeightManager.h135),
                                    imageUrl: CaroaslCubit.get(context)
                                        .data[index]
                                        .imagePath,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: HeightManager.h5,
            ),
            BlocBuilder<CaroaslCubit, CarosalState>(
              builder: (context, state) {
                return CustomIndicator(
                  itemCount: CaroaslCubit.get(context).data.length <= 5
                      ? CaroaslCubit.get(context).data.length
                      : 5,
                  currentIndex: CaroaslCubit.get(context).getCurrentIndex(),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
