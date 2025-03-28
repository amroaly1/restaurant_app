import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/features/home/manager/top_rating_cubit/top_rate_cubit.dart';
import 'package:ecommerce_app/features/home/manager/top_rating_cubit/top_rate_state.dart';
import 'package:ecommerce_app/features/home/presentation/widget/custom_recommended_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class RecommendedSections extends StatelessWidget {
  const RecommendedSections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRateCubit, TopRateState>(
      builder: (context, state) {
        if (state is TopRateFailing) {
          return Padding(
            padding: PaddingManager.paddingHorizontalBody,
            child: SliverToBoxAdapter(
              child: Center(
                child: Text(
                  state.errMessage,
                  style: TextStyleManager.meduim(
                    size: TextSizeManager.s20,
                  ),
                ),
              ),
            ),
          );
        } else if (state is TopRateLoading) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: PaddingManager.paddingHorizontalBody,
              child: Shimmer.fromColors(
                baseColor: ColorManager.greyColor,
                highlightColor: ColorManager.secondaryColor,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: WidthManager.w159 / HeightManager.h140,
                    mainAxisSpacing: HeightManager.h10,
                    crossAxisSpacing: WidthManager.w7,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          RaduisManager.r12,
                        ),
                        color: ColorManager.greyColor,
                      ),
                    );
                  },
                  itemCount: 2,
                ),
              ),
            ),
          );
        }
        return SliverPadding(
          padding: PaddingManager.paddingHorizontalBody,
          sliver: SliverGrid.builder(
            itemCount: TopRateCubit.get(context).data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: WidthManager.w159 / HeightManager.h140,
              mainAxisSpacing: HeightManager.h10,
              crossAxisSpacing: WidthManager.w7,
            ),
            itemBuilder: (context, index) {
              return CustomRecommendedCard(
                productModel: TopRateCubit.get(context).data[index],
              );
            },
          ),
        );
      },
    );
  }
}
