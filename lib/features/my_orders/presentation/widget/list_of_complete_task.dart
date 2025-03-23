import 'package:ecommerce_app/core/helper/formate_date.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/features/my_orders/data/model/order_type_model.dart';
import 'package:ecommerce_app/features/my_orders/presentation/order_details_view.dart';
import 'package:ecommerce_app/features/my_orders/presentation/widget/custom_of_complete_or_cancel_order.dart';
import 'package:flutter/material.dart';

class ListOfCompleteTask extends StatelessWidget {
  const ListOfCompleteTask({super.key, required this.orderType});
  final List<OrderTypeModel> orderType;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return CustomOfCompleteOrCancelTask(
          isComplete: true,
          item: orderType[index].items![0],
          date: formatDate(orderType[index].orderDate!),
          onTap: () {
            RouteManager.navigateTo(
              OrderDetailsView(
                isComplete: true,
                order: orderType[index],
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: HeightManager.h17),
          child: Divider(
            color: ColorManager.yellowColor,
          ),
        );
      },
      itemCount: orderType.length,
    );
  }
}
