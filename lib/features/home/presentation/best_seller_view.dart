import 'package:ecommerce_app/core/helper/arrow_direction.dart';
import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/custom_list_of_items.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BestSellerView extends StatelessWidget {
  const BestSellerView({super.key});

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
          LanguageGlobaleVar.bestSeller.tr,
          style: TextStyleManager.bold(
            size: TextSizeManager.s28,
            color: ColorManager.whiteColor,
          ),
        ),
      ),
      body: CustomWhiteBackground(
        child: Padding(
          padding: PaddingManager.paddingHorizontalBody,
          child: Column(
            children: [
              SizedBox(
                height: HeightManager.h37,
              ),
              CustomListOfItems(),
            ],
          ),
        ),
      ),
    );
  }
}
