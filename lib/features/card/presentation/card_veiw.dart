import 'package:ecommerce_app/core/helper/arrow_direction.dart';
import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/core/widget/default_button.dart';
import 'package:ecommerce_app/features/card/presentation/confirm_order_view.dart';
import 'package:ecommerce_app/features/card/presentation/widget/custom_list_of_card_item.dart';
import 'package:ecommerce_app/features/card/presentation/widget/custom_list_of_cost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CardVeiw extends StatelessWidget {
  const CardVeiw({super.key});

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
          LanguageGlobaleVar.card.tr,
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
                    Text(
                      "You have 2  items in the cart",
                      style: TextStyleManager.regular(
                        size: TextSizeManager.s20,
                      ),
                    ),
                    SizedBox(
                      height: HeightManager.h20,
                    ),
                  ],
                ),
              ),
              CustomListOfCardItem(),
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
                      height: HeightManager.h50,
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
                      height: HeightManager.h80,
                    ),
                    DefaultButton(
                      text: "Checkout",
                      backgroundColor: ColorManager.primaryColor,
                      textColor: ColorManager.secondaryColor,
                      onPressed: () {
                        // go to card confirm

                        RouteManager.navigateToAndNoOptionToBack(
                          MyConfirmOrdersView(),
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
        ),
      ),
    );
  }
}
