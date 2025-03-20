import 'package:ecommerce_app/core/utils/asset_icon_manager.dart';
import 'package:ecommerce_app/core/utils/asset_image_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomRecommendedCard extends StatelessWidget {
  const CustomRecommendedCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RaduisManager.r12),
            image: DecorationImage(
              image: AssetImage(
                AssetImageManager.recommended,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        PositionedDirectional(
          top: HeightManager.h12,
          start: WidthManager.w12,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: WidthManager.w5,
                  right: WidthManager.w5,
                  top: HeightManager.h3,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorManager.whiteColor,
                  borderRadius: BorderRadius.circular(
                    RaduisManager.r30,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "5.0",
                      style: TextStyleManager.regular(
                        size: TextSizeManager.s12,
                        height: 0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: WidthManager.w4),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: HeightManager.h4,
                      ),
                      child: SvgPicture.asset(
                        AssetIconManager.star,
                        height: HeightManager.h12,
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: WidthManager.w5),
              Container(
                padding: EdgeInsets.all(
                  PaddingManager.p4,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.whiteColor,
                ),
                // child: SvgPicture.asset(
                //     AssetIconManager.love,
                //     height: HeightManager.h12,
                //     fit: BoxFit.fill,
                //     colorFilter: ColorFilter.mode(
                //         Colors.white,
                //         BlendMode.srcIn)),
                child: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.favorite,
                    size: HeightManager.h12,
                    color: ColorManager.redColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        PositionedDirectional(
          end: 0,
          bottom: HeightManager.h12,
          child: Container(
            padding: EdgeInsetsDirectional.only(
              start: WidthManager.w7,
            ),
            decoration: BoxDecoration(
              color: ColorManager.secondaryColor,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(RaduisManager.r10),
                bottomStart: Radius.circular(RaduisManager.r10),
              ),
            ),
            child: Text(
              "\$103.0",
              style: TextStyleManager.regular(
                size: TextSizeManager.s12,
                color: ColorManager.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
