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
import 'package:flutter/widgets.dart';
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
      create: (context) => CaroaslCubit()..repeate(),
      child: BlocBuilder<CaroaslCubit, CarosalState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: DeviceWidthHeight.perentageOfHeight(HeightManager.h135),
                child: PageView.builder(
                  controller: CaroaslCubit.get(context).pageController,
                  itemCount: 5,
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        "Experience our delicious new dish",
                                        style: TextStyleManager.regular(
                                          size: TextSizeManager.s16,
                                          color: ColorManager.whiteColor,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Text(
                                      "30% OFF",
                                      style: TextStyleManager.bold(
                                        size: TextSizeManager.s32,
                                        color: ColorManager.whiteColor,
                                      ),
                                    )
                                  ],
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
                                  child: Image.asset(
                                    AssetImageManager.photoPizzaSlider,
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
                  itemCount: 5,
                  currentIndex: CaroaslCubit.get(context).currentIndex),
            ],
          );
        },
      ),
    );
  }
}
