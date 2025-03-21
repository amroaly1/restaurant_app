import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/features/profile/data/repo/profile_repo.dart';
import 'package:flutter/material.dart';

class CustomProfileAppBard extends StatelessWidget {
  const CustomProfileAppBard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceWidthHeight.perentageOfHeight(
        HeightManager.h129,
      ),
      child: Padding(
        padding: PaddingManager.paddingHorizontalBody,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: HeightManager.h50,
                width: WidthManager.w50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.secondaryColor,
                ),
                child: ProfileRepo.image(),
              ),
              SizedBox(width: WidthManager.w23),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ProfileRepo.userName(),
                    style: TextStyleManager.meduim(
                      size: TextSizeManager.s33,
                      color: ColorManager.white1Color,
                      height: 0,
                    ),
                  ),
                  Text(
                    ProfileRepo.userEmail(),
                    style: TextStyleManager.meduim(
                      size: TextSizeManager.s16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
