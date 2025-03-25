import 'package:ecommerce_app/core/helper/app_message.dart';
import 'package:ecommerce_app/core/helper/arrow_direction.dart';
import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/custom_circle_progress_indicator.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/core/widget/default_button.dart';
import 'package:ecommerce_app/features/card/manager/card_cubit/card_cubit.dart';
import 'package:ecommerce_app/features/card/manager/confirm_order_cubit/confirm_order_cubit.dart';
import 'package:ecommerce_app/features/card/manager/confirm_order_cubit/confirm_order_state.dart';
import 'package:ecommerce_app/features/card/presentation/widget/custom_list_of_confirm_item.dart';
import 'package:ecommerce_app/features/card/presentation/widget/custom_list_of_cost.dart';
import 'package:ecommerce_app/features/home/presentation/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyConfirmOrdersView extends StatelessWidget {
  const MyConfirmOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorManager.primaryColor,
            toolbarHeight: DeviceWidthHeight.perentageOfHeight(
              HeightManager.h129,
            ),
            leading: InkWell(
              onTap: () {
                RouteManager.backFrom();
              },
              child: SvgPicture.asset(
                ArrowDirection.arrowDirectionEnLeft(),
                fit: BoxFit.scaleDown,
              ),
            ),
            centerTitle: true,
            title: Text(
              LanguageGlobaleVar.confirmOrder.tr,
              style: TextStyleManager.bold(
                size: TextSizeManager.s28,
                color: ColorManager.whiteColor,
              ),
            ),
          ),
          body: CustomWhiteBackground(
            child: Padding(
              padding: PaddingManager.paddingHorizontalBody,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: HeightManager.h50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Shipping Address",
                              style: TextStyleManager.bold(
                                size: TextSizeManager.s24,
                              ),
                            ),
                            Text(
                              "Open Maps",
                              style: TextStyleManager.meduim(
                                size: TextSizeManager.s15,
                                color: ColorManager.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: HeightManager.h20),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: HeightManager.h11,
                            horizontal: WidthManager.w15,
                          ),
                          decoration: BoxDecoration(
                            color: ColorManager.yellowColor,
                            borderRadius: BorderRadius.circular(
                              RaduisManager.r20,
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "778 Locust View Drive Oaklanda, CA",
                                style: TextStyleManager.regular(
                                  size: TextSizeManager.s16,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: HeightManager.h50),
                        Text(
                          "Order Summary",
                          style: TextStyleManager.meduim(
                            size: TextSizeManager.s20,
                          ),
                        ),
                        SizedBox(
                          height: HeightManager.h10,
                        ),
                        Divider(
                          color: ColorManager.yellowColor,
                        ),
                        SizedBox(
                          height: HeightManager.h10,
                        ),
                      ],
                    ),
                  ),
                  CustomListOfConfirmItem(
                    data: CardCubit.get(context).getData(),
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
                      CardCubit.get(context).price(),
                      0,
                      0,
                      CardCubit.get(context).price()
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(
                          height: HeightManager.h40,
                        ),
                        BlocProvider(
                          create: (context) => ConfirmOrderCubit(),
                          child: BlocConsumer<ConfirmOrderCubit,
                              ConfirmOrderState>(
                            listener: (context, state) {
                              if (state is ConfirmOrderFailing) {
                                AppMessage.showMessage1(
                                    title: LanguageGlobaleVar.error,
                                    body: state.errMessage);
                              } else if (state is ConfirmOrderSuccess) {
                                RouteManager.navigateToAndNoOptionToBack(
                                    HomeView());
                              }
                            },
                            builder: (context, state) {
                              if (state is ConfirmOrderLaoding) {
                                return Center(
                                  child: CustomCircleProgressIndicator(),
                                );
                              }
                              return DefaultButton(
                                text: "Place Order",
                                backgroundColor: ColorManager.primaryColor,
                                textColor: ColorManager.secondaryColor,
                                onPressed:
                                    ConfirmOrderCubit.get(context).placeOrdr,
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: HeightManager.h80,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
