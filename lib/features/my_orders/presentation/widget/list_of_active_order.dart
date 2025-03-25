import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/helper/formate_date.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/features/my_orders/data/model/item_model.dart';
import 'package:ecommerce_app/features/my_orders/data/model/order_type_model.dart';
import 'package:ecommerce_app/features/my_orders/manager/my_order_cubit/my_order_cubit.dart';
import 'package:ecommerce_app/features/my_orders/presentation/order_details_view.dart';
import 'package:ecommerce_app/features/my_orders/presentation/widget/custom_button_of_order.dart';
import 'package:flutter/material.dart';

class ListOfActiveOrder extends StatelessWidget {
  const ListOfActiveOrder({super.key, required this.orderType});
  final List<OrderTypeModel> orderType;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return CustomCardOfActiveOrder(
          orderId: orderType[index].id!,
          onTap: () {
            RouteManager.navigateTo(OrderDetailsView(
              order: orderType[index],
            ));
          },
          date: formatDate(orderType[index].orderDate!),
          item: orderType[index].items![0],
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

class CustomCardOfActiveOrder extends StatelessWidget {
  const CustomCardOfActiveOrder({
    super.key,
    this.onTap,
    required this.item,
    required this.date,
    required this.orderId,
  });
  final void Function()? onTap;
  final ItemModel item;
  final String date;
  final int orderId;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceWidthHeight.perentageOfHeight(HeightManager.h108),
      child: Row(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: DeviceWidthHeight.perentageOfHeight(HeightManager.h108),
              width: DeviceWidthHeight.perentageOfWidth(WidthManager.w72),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  RaduisManager.r20,
                ),
              ),
              child: Image.network(
                item.imagePath,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: WidthManager.w12,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        item.name,
                        style: TextStyleManager.meduim(
                          size: TextSizeManager.s20,
                        ),
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "\$${item.price}",
                        style: TextStyleManager.meduim(
                          size: TextSizeManager.s20,
                          color: ColorManager.secondaryColor,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: TextStyleManager.light(
                        size: TextSizeManager.s14,
                      ),
                    ),
                    Text(
                      "${item.quantity} items",
                      style: TextStyleManager.light(
                        size: TextSizeManager.s14,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButtonOfOrder(
                      title: "Cancel Order",
                      isActive: true,
                      textSize: TextSizeManager.s15,
                      onTap: () =>
                          MyOrderCubit.get(context).cancelOrder(orderId),
                    ),
                    CustomButtonOfOrder(
                      title: "Track Driver",
                      isActive: false,
                      textSize: TextSizeManager.s15,
                      onTap: () {
                        // track order
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
