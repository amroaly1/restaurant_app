import 'package:ecommerce_app/core/model/my_card_model.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/features/card/presentation/widget/custom_card_of_confirm_order.dart';
import 'package:flutter/material.dart';

class CustomListOfConfirmItem extends StatelessWidget {
  const CustomListOfConfirmItem({super.key, required this.data});
  final List<MyCardModel> data;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return CustomCardOfConfirmOrder(
          card: data[index],
        );
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: HeightManager.h12),
          child: Divider(
            color: ColorManager.yellowColor,
          ),
        );
      },
      itemCount: data.length,
    );
  }
}
