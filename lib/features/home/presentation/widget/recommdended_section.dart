import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/features/home/presentation/widget/custom_recommended_card.dart';
import 'package:flutter/material.dart';

class RecommendedSections extends StatelessWidget {
  const RecommendedSections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      // padding: EdgeInsets.only(top: 9),
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: WidthManager.w159 / HeightManager.h140,
        mainAxisSpacing: HeightManager.h10,
        crossAxisSpacing: WidthManager.w7,
      ),
      itemBuilder: (context, index) {
        return CustomRecommendedCard();
      },
    );
  }
}
