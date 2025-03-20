import 'package:ecommerce_app/core/helper/arrow_direction.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/features/home/presentation/widget/custom_card_of_best_seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomBestSellerSection extends StatelessWidget {
  const CustomBestSellerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LanguageGlobaleVar.bestSeller.tr,
              style: TextStyleManager.meduim(
                size: TextSizeManager.s20,
              ),
            ),
            InkWell(
              onTap: () {
                // go to best seller
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: Text(
                      LanguageGlobaleVar.viewAll.tr,
                      style: TextStyleManager.semiBoald(
                        size: TextSizeManager.s12,
                        color: ColorManager.secondaryColor,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: WidthManager.w7,
                  ),
                  SvgPicture.asset(
                    ArrowDirection.arrowDirectionEnRight(),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: HeightManager.h10),
        ListOfBestSeller(),
      ],
    );
  }
}
