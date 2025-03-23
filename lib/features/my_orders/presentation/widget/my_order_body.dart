import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/custom_circle_progress_indicator.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/features/my_orders/manager/my_order_cubit/my_order_cubit.dart';
import 'package:ecommerce_app/features/my_orders/manager/my_order_cubit/my_order_state.dart';
import 'package:ecommerce_app/features/my_orders/presentation/widget/custom_button_of_order.dart';
import 'package:ecommerce_app/features/my_orders/presentation/widget/no_date_my_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderBody extends StatelessWidget {
  const MyOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomWhiteBackground(
      child: Padding(
        padding: PaddingManager.paddingHorizontalBody,
        child: BlocConsumer<MyOrderCubit, MyOrderState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is MyOrderGetDataLaoding) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(height: HeightManager.h27),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            3,
                            (index) => CustomButtonOfOrder(
                              onTap: () => MyOrderCubit.get(context)
                                  .changeCurrentIndex(index),
                              title:
                                  MyOrderCubit.get(context).myOrderType[index],
                              isActive: index ==
                                  MyOrderCubit.get(context).currentIndex,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverFillRemaining(
                    child: Center(
                      child: CustomCircleProgressIndicator(),
                    ),
                  ),
                ],
              );
            } else if (state is MyOrderGetDataFailing) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(height: HeightManager.h27),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            3,
                            (index) => CustomButtonOfOrder(
                              onTap: () => MyOrderCubit.get(context)
                                  .changeCurrentIndex(index),
                              title:
                                  MyOrderCubit.get(context).myOrderType[index],
                              isActive: index ==
                                  MyOrderCubit.get(context).currentIndex,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverFillRemaining(
                    child: Center(
                      child: Text(
                        state.errMessage,
                        style: TextStyleManager.bold(
                          size: TextSizeManager.s20,
                          color: ColorManager.redColor,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: HeightManager.h27),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          3,
                          (index) => CustomButtonOfOrder(
                            onTap: () => MyOrderCubit.get(context)
                                .changeCurrentIndex(index),
                            title: MyOrderCubit.get(context).myOrderType[index],
                            isActive:
                                index == MyOrderCubit.get(context).currentIndex,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                MyOrderCubit.get(context).orderType.isEmpty
                    ? NoDataMyOrder()
                    : SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: HeightManager.h19,
                              bottom: HeightManager.h11),
                          child: Divider(
                            color: ColorManager.yellowColor,
                          ),
                        ),
                      ),
                MyOrderCubit.get(context).orderType.isNotEmpty
                    ? MyOrderCubit.get(context).currentList()
                    : SliverToBoxAdapter(),
                MyOrderCubit.get(context).orderType.isNotEmpty
                    ? SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: HeightManager.h15,
                              bottom: HeightManager.h20),
                          child: Divider(
                            color: ColorManager.yellowColor,
                          ),
                        ),
                      )
                    : SliverToBoxAdapter(),

                // data of my order
              ],
            );
          },
        ),
      ),
    );
  }
}
