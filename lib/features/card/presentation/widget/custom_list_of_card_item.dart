import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/features/card/presentation/widget/custom_card_item.dart';
import 'package:flutter/material.dart';

class CustomListOfCardItem extends StatelessWidget {
  const CustomListOfCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return CustomCardItem();
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: HeightManager.h12),
          child: Divider(
            color: ColorManager.yellowColor,
          ),
        );
      },
      itemCount: 2,
    );
  }
}
