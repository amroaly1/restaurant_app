import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/manager/carousal_cubit/caroasl_cubit.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/custom_carousal_slider.dart';
import 'package:ecommerce_app/core/widget/custom_search_and_card_shooping.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/features/home/manager/best_seller_cubit/best_seller_cubit.dart';
import 'package:ecommerce_app/features/home/manager/top_rating_cubit/top_rate_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/widget/custom_best_seller_section.dart';
import 'package:ecommerce_app/features/home/presentation/widget/recommdended_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDataView extends StatelessWidget {
  const HomeDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BestSellerCubit.get(context).getData();
        CaroaslCubit.get(context).getData();
        TopRateCubit.get(context).getDate();
      },
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: PaddingManager.paddingHorizontalBody,
              child: SizedBox(
                height: DeviceWidthHeight.perentageOfHeight(HeightManager.h180),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSearchAndCardShooping(),
                      SizedBox(height: HeightManager.h16),
                      Text(
                        LanguageGlobaleVar.goodMorning.tr,
                        style: TextStyleManager.bold(
                          size: TextSizeManager.s30,
                          color: ColorManager.white1Color,
                          height: 1,
                        ),
                      ),
                      Text(
                        LanguageGlobaleVar.riseandshine.tr,
                        style: TextStyleManager.meduim(
                          size: TextSizeManager.s13,
                          color: ColorManager.secondaryColor,
                          height: 1,
                        ),
                      ),
                      SizedBox(height: HeightManager.h17),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: CustomWhiteBackground(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: HeightManager.h34),
                          Padding(
                            padding: PaddingManager.paddingHorizontalBody,
                            child: CustomBestSellerSection(),
                          ),
                          SizedBox(height: HeightManager.h20),
                          CustomCarouselSlider(),
                          SizedBox(height: HeightManager.h20),
                          Padding(
                            padding: PaddingManager.paddingHorizontalBody,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LanguageGlobaleVar.recommend.tr,
                                  style: TextStyleManager.meduim(
                                    size: TextSizeManager.s20,
                                  ),
                                ),
                                SizedBox(height: HeightManager.h5),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    RecommendedSections(),
                    SliverToBoxAdapter(
                      child: SizedBox(height: HeightManager.h20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
