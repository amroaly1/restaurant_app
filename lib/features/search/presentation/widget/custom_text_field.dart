import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DeviceWidthHeight.perentageOfWidth(WidthManager.w282),
      height: DeviceWidthHeight.perentageOfHeight(HeightManager.h37),
      child: InkWell(
        onTap: () {},
        child: TextField(
          onChanged: (value) {},
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
            focusedBorder: outlineInputBorder(color: ColorManager.blueColor),
            errorBorder: outlineInputBorder(color: ColorManager.redColor),
            focusedErrorBorder:
                outlineInputBorder(color: ColorManager.blueColor),
            disabledBorder: outlineInputBorder(),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(
      {Color color = ColorManager.whiteColor}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(
        RaduisManager.r30,
      ),
    );
  }
}
