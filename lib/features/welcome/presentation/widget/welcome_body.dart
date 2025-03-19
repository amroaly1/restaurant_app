import 'package:ecommerce_app/core/constant/constant.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/utils/asset_icon_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/font_family_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/default_button.dart';
import 'package:ecommerce_app/features/auth/login/presentation/log_in_view.dart';
import 'package:ecommerce_app/features/auth/signup/presentation/sigin_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(
          flex: 2,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: HeightManager.h27,
          children: [
            SvgPicture.asset(
              AssetIconManager.logo,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  yum,
                  style: TextStyleManager.extraBold(
                    size: TextSizeManager.s35,
                    fontfamily: FontFamilyManager.poppins,
                    color: ColorManager.primaryColor,
                  ),
                ),
                Text(
                  quick,
                  style: TextStyleManager.bold(
                    size: TextSizeManager.s35,
                    fontfamily: FontFamilyManager.poppins,
                    color: ColorManager.whiteColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: HeightManager.h30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: WidthManager.w49),
          child: Text(
            LanguageGlobaleVar.welcomeDesc.tr,
            style: TextStyleManager.meduim(
              size: TextSizeManager.s14,
              color: ColorManager.whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: HeightManager.h44),
        Column(
          children: [
            DefaultButton(
              text: LanguageGlobaleVar.login.tr,
              backgroundColor: ColorManager.primaryColor,
              textColor: ColorManager.secondaryColor,
              onPressed: () {
                // toDo navigate to login
                // RouteManager.navigateTo(LogInView());
                RouteManager.navigateToAndNoOptionToBack(LogInView());
              },
            ),
            SizedBox(height: HeightManager.h4),
            DefaultButton(
              text: LanguageGlobaleVar.signUp.tr,
              backgroundColor: ColorManager.yellowColor,
              textColor: ColorManager.secondaryColor,
              onPressed: () {
                // toDo navigate to sign up
                // RouteManager.navigateTo(SiginUpView());
                RouteManager.navigateToAndNoOptionToBack(SiginUpView());
              },
            ),
          ],
        ),
        Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
