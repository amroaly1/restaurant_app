import 'dart:async';

import 'package:ecommerce_app/core/helper/app_message.dart';
import 'package:ecommerce_app/core/helper/formate_date.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/custom_circle_progress_indicator.dart';
import 'package:ecommerce_app/features/card/presentation/widget/custom_list_of_cost.dart';
import 'package:ecommerce_app/features/my_orders/data/model/order_type_model.dart';
import 'package:ecommerce_app/features/my_orders/manager/my_order_cubit/my_order_cubit.dart';
import 'package:ecommerce_app/features/my_orders/manager/my_order_cubit/my_order_state.dart';
import 'package:ecommerce_app/features/my_orders/presentation/widget/custom_button_of_order.dart';
import 'package:ecommerce_app/features/my_orders/presentation/widget/custom_list_of_order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class OrderDetailsBody extends StatelessWidget {
  const OrderDetailsBody({
    super.key,
    required this.isComplete,
    required this.order,
  });
  final bool isComplete;
  final OrderTypeModel order;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.paddingHorizontalBody,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: HeightManager.h30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order No. 0054752",
                      style: TextStyleManager.meduim(
                        size: TextSizeManager.s20,
                      ),
                    ),
                    Text(
                      isComplete ? "Completed" : "Active",
                      style: TextStyleManager.meduim(
                        size: TextSizeManager.s20,
                        color: ColorManager.secondaryColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  formatDate(order.orderDate!),
                  style: TextStyleManager.light(
                    size: TextSizeManager.s14,
                  ),
                ),
                SizedBox(
                  height: HeightManager.h15,
                ),
                Divider(
                  color: ColorManager.yellowColor,
                ),
                SizedBox(
                  height: HeightManager.h15,
                ),
              ],
            ),
          ),
          CustomListOfOrderDetails(
            items: order.items!,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: HeightManager.h12),
                  child: Divider(
                    color: ColorManager.yellowColor,
                  ),
                ),
                SizedBox(
                  height: HeightManager.h27,
                ),
              ],
            ),
          ),
          CustomListOfCost(
            price: [
              order.subtotal!,
              order.tax!,
              order.shipping!,
              order.total!,
            ],
          ),
          isComplete
              ? SliverToBoxAdapter()
              : SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(
                        height: HeightManager.h40,
                      ),
                      BlocConsumer<MyOrderCubit, MyOrderState>(
                        listener: (context, state) {
                          if (state is MyOrderCancelOrderSuccess) {
                            AppMessage.showMessage2(
                                title: LanguageGlobaleVar.success.tr,
                                body: "Cancel Order Success");
                            Timer(const Duration(seconds: 4), () {
                              RouteManager.backFrom();
                            });
                            // RouteManager.backFrom();
                          } else if (state is MyOrderCancelOrderFailing) {
                            AppMessage.showMessage1(
                                title: LanguageGlobaleVar.error.tr,
                                body: state.errMessage);
                          }
                        },
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              state is MyOrderCancelOrderLoading
                                  ? CustomCircleProgressIndicator()
                                  : CustomButtonOfOrder(
                                      title: "Cancel Order",
                                      isActive: true,
                                      textSize: TextSizeManager.s15,
                                      onTap: state is MyOrderCancelOrderSuccess
                                          ? () {}
                                          : () => MyOrderCubit.get(context)
                                              .cancelOrder(order.id!),
                                    ),
                              SizedBox(
                                width: WidthManager.w5,
                              ),
                              CustomButtonOfOrder(
                                title: "Track Driver",
                                isActive: false,
                                textSize: TextSizeManager.s15,
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: HeightManager.h80,
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
