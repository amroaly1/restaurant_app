import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/font_family_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/custom_indicator.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/features/on_boarding/data/model/on_bording_model.dart';
import 'package:ecommerce_app/features/on_boarding/manager/on_bording_cubit/on_boarding_cubit.dart';
import 'package:ecommerce_app/features/on_boarding/presentation/widget/on_boarding_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomCardOfOnBoarding extends StatelessWidget {
  const CustomCardOfOnBoarding({
    super.key,
    required this.onBoardingModel,
    required this.index,
    required this.lenght,
  });
  final OnBordingModel onBoardingModel;
  final int index;
  final int lenght;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          onBoardingModel.image,
          fit: BoxFit.fill,
          width: DeviceWidthHeight.width,
        ),
        Positioned(
          bottom: 0,
          child: CustomWhiteBackground(
            height: DeviceWidthHeight.perentageOfHeight(
              HeightManager.h338,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: HeightManager.h20,
              children: [
                SvgPicture.asset(
                  onBoardingModel.icon,
                ),
                Text(
                  onBoardingModel.title,
                  style: TextStyleManager.black(
                    size: TextSizeManager.s24,
                    fontfamily: FontFamilyManager.inter,
                    color: ColorManager.secondaryColor,
                  ),
                ),
                Text(
                  onBoardingModel.description,
                  style: TextStyleManager.meduim(
                    size: TextSizeManager.s14,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: HeightManager.h5),
                  child:
                      CustomIndicator(itemCount: lenght, currentIndex: index),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: HeightManager.h5),
                  child: OnBoardingButton(
                    text: LanguageGlobaleVar.next.tr,
                    onPressed: OnBoardingCubit.get(context).goToNextPage,
                  ),
                ),
              ],
            ),
          ),
        ),
        PositionedDirectional(
            end: WidthManager.w20,
            top: HeightManager.h20,
            child: SafeArea(
              child: InkWell(
                onTap: OnBoardingCubit.get(context).goToWelcomScreen,
                child: Row(
                  children: [
                    Text(
                      LanguageGlobaleVar.skip.tr,
                      style: TextStyleManager.semiBoald(
                        size: TextSizeManager.s15,
                        color: ColorManager.secondaryColor,
                      ),
                    ),
                    SizedBox(
                      width: WidthManager.w7,
                    ),
                    SvgPicture.asset(
                      OnBoardingCubit.get(context).arrowDirection(),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
