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
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/core/widget/default_button.dart';
import 'package:ecommerce_app/features/card/presentation/widget/custom_list_of_confirm_item.dart';
import 'package:ecommerce_app/features/card/presentation/widget/custom_list_of_cost.dart';
import 'package:ecommerce_app/features/home/presentation/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyConfirmOrdersView extends StatelessWidget {
  const MyConfirmOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
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
              CustomListOfConfirmItem(),
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
                price: [0, 0, 0, 0],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: HeightManager.h40,
                    ),
                    DefaultButton(
                      text: "Place Order",
                      backgroundColor: ColorManager.primaryColor,
                      textColor: ColorManager.secondaryColor,
                      onPressed: () {
                        // go to home page
                        RouteManager.navigateToAndNoOptionToBack(HomeView());
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
        ),
      ),
    );
  }
}
