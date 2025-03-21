import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/utils/asset_icon_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/features/search/presentation/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomSearchAndCardShooping extends StatelessWidget {
  const CustomSearchAndCardShooping({super.key, this.onTap});
  // final void Function(String)? onChanged;
  // final TextEditingController? controller;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: HeightManager.h30,
        width: DeviceWidthHeight.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: DeviceWidthHeight.perentageOfWidth(WidthManager.w282),
              child: InkWell(
                onTap: () {
                  RouteManager.navigateTo(SearchView());
                },
                child: TextField(
                  enabled: false,
                  // controller: controller,
                  style: TextStyleManager.light(
                    size: TextSizeManager.s18,
                    color: ColorManager.grey1Color,
                  ),
                  cursorHeight: HeightManager.h15,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorManager.whiteColor,
                    hintText: LanguageGlobaleVar.search.tr,
                    hintStyle: TextStyleManager.light(
                      size: TextSizeManager.s12,
                      color: ColorManager.grey1Color,
                    ),
                    enabledBorder: outlineInputBorder(),
                    focusedBorder:
                        outlineInputBorder(color: ColorManager.blueColor),
                    errorBorder:
                        outlineInputBorder(color: ColorManager.redColor),
                    focusedErrorBorder:
                        outlineInputBorder(color: ColorManager.blueColor),
                    disabledBorder: outlineInputBorder(),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.all(PaddingManager.p5),
                decoration: BoxDecoration(
                  color: ColorManager.whiteColor,
                  borderRadius: BorderRadius.circular(
                    RaduisManager.r10,
                  ),
                ),
                child: SvgPicture.asset(
                  AssetIconManager.shoopingIcon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(
      {Color color = ColorManager.whiteColor}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
      borderRadius: BorderRadius.circular(
        RaduisManager.r30,
      ),
    );
  }
}
