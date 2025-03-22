import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/features/my_orders/presentation/widget/custom_of_complete_or_cancel_order.dart';
import 'package:flutter/material.dart';

class ListOfCancelOrder extends StatelessWidget {
  const ListOfCancelOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return CustomOfCompleteOrCancelTask();
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: HeightManager.h17),
          child: Divider(
            color: ColorManager.yellowColor,
          ),
        );
      },
      itemCount: 2,
    );
  }
}
