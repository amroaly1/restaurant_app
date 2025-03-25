import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/manager/carousal_cubit/caroasl_cubit.dart';
import 'package:ecommerce_app/core/manager/carousal_cubit/carosal_state.dart';
import 'package:ecommerce_app/core/utils/asset_image_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/custom_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  @override
  void dispose() {
    CaroaslCubit.disposeTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CaroaslCubit()..getData(),
      child: BlocBuilder<CaroaslCubit, CarosalState>(
        builder: (context, state) {
          if (state is CarosalGetDataLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CarosalGetDataFailure) {
            return SizedBox(
              height: DeviceWidthHeight.perentageOfHeight(HeightManager.h135),
              child: Center(
                child: Text(
                  state.errMessage,
                  style: TextStyleManager.bold(
                      size: TextSizeManager.s18, color: ColorManager.redColor),
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
                    return Stack(
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
                                  child: Image.network(
                                    CaroaslCubit.get(context)
                                        .data[index]
                                        .imagePath,
                                    fit: BoxFit.fill,
                                    height: DeviceWidthHeight.perentageOfHeight(
                                        HeightManager.h135),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: HeightManager.h5,
              ),
              CustomIndicator(
                  itemCount: CaroaslCubit.get(context).data.length <= 5
                      ? CaroaslCubit.get(context).data.length
                      : 5,
                  currentIndex: CaroaslCubit.get(context).currentIndex),
            ],
          );
        },
      ),
    );
  }
}
