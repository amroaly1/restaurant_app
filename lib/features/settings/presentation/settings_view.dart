import 'package:ecommerce_app/core/constant/constant.dart';
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
import 'package:ecommerce_app/features/settings/manager/setting_cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit(),
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
              LanguageGlobaleVar.settings.tr,
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
                  SizedBox(height: HeightManager.h37),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LanguageGlobaleVar.language.tr,
                        style: TextStyleManager.meduim(
                          size: TextSizeManager.s24,
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: SettingCubit.get(context)
                                .changeLanguageToArabic,
                            child: Container(
                              height: HeightManager.h44,
                              width: WidthManager.w50,
                              decoration: BoxDecoration(
                                color: ColorManager.primaryColor,
                                borderRadius: BorderRadiusDirectional.only(
                                  topStart: Radius.circular(
                                    RaduisManager.r10,
                                  ),
                                  bottomStart: Radius.circular(
                                    RaduisManager.r10,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  ar,
                                  style: TextStyleManager.meduim(
                                    size: TextSizeManager.s20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: SettingCubit.get(context)
                                .changeLanguageToEnglish,
                            child: Container(
                              height: HeightManager.h44,
                              width: WidthManager.w50,
                              decoration: BoxDecoration(
                                color: ColorManager.secondaryColor,
                                borderRadius: BorderRadiusDirectional.only(
                                  topEnd: Radius.circular(
                                    RaduisManager.r10,
                                  ),
                                  bottomEnd: Radius.circular(
                                    RaduisManager.r10,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  en,
                                  style: TextStyleManager.meduim(
                                    size: TextSizeManager.s20,
                                    color: ColorManager.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
