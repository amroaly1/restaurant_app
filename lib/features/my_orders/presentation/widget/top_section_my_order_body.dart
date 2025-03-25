import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/features/my_orders/manager/my_order_cubit/my_order_cubit.dart';
import 'package:ecommerce_app/features/my_orders/presentation/widget/custom_button_of_order.dart';
import 'package:flutter/material.dart';

class TopSectionMyOrderBody extends StatelessWidget {
  const TopSectionMyOrderBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(height: HeightManager.h27),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) => CustomButtonOfOrder(
                onTap: () =>
                    MyOrderCubit.get(context).changeCurrentIndex(index),
                title: MyOrderCubit.get(context).getMyOrderTypeTitil()[index],
                isActive: index == MyOrderCubit.get(context).currentIndex,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
