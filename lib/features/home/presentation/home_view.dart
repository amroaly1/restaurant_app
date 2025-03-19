import 'package:ecommerce_app/core/constant/constant.dart';
import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: DeviceWidthHeight.perentageOfHeight(HeightManager.h61),
        width: DeviceWidthHeight.width,
        decoration: BoxDecoration(
          color: ColorManager.secondaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(RaduisManager.r35),
            topLeft: Radius.circular(RaduisManager.r35),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            botttomNavigationBarIcons.length,
            (index) {
              return SvgPicture.asset(
                botttomNavigationBarIcons[index],
                colorFilter: ColorFilter.mode(
                  index == 0
                      ? ColorManager.primaryColor
                      : ColorManager.whiteColor,
                  BlendMode.srcIn,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
