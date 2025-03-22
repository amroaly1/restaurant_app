import 'package:ecommerce_app/core/utils/asset_icon_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoDataMyOrder extends StatelessWidget {
  const NoDataMyOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetIconManager.noDataInMyOrder,
          ),
          SizedBox(
            height: HeightManager.h40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: WidthManager.w12,
            ),
            child: Text(
              "You don't have any active orders at this time",
              style: TextStyleManager.meduim(
                size: TextSizeManager.s30,
                color: ColorManager.secondaryColor,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
