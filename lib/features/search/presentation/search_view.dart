import 'package:ecommerce_app/core/helper/arrow_direction.dart';
import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/widget/custom_list_of_items.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/features/search/presentation/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

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
        title: CustomTextField(),
      ),
      body: CustomWhiteBackground(
        child: Padding(
          padding: PaddingManager.paddingHorizontalBody,
          child: Column(
            children: [
              SizedBox(
                height: HeightManager.h37,
              ),

              // path data to it
              // CustomListOfItems(),
            ],
          ),
        ),
      ),
    );
  }
}
