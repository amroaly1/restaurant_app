import 'package:ecommerce_app/core/helper/arrow_direction.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/features/profile/data/model/setting_crad_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSettingCard extends StatelessWidget {
  const CustomSettingCard({
    super.key,
    required this.model,
    this.isEnd = true,
    this.onTap,
  });
  final SettingCradModel model;
  final bool isEnd;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: SvgPicture.asset(
          model.icon,
          colorFilter:
              ColorFilter.mode(ColorManager.secondaryColor, BlendMode.srcIn),
          width: WidthManager.w24,
          height: HeightManager.h26,
        ),
        title: Text(
          model.title,
          style: TextStyleManager.meduim(
            size: TextSizeManager.s24,
          ),
        ),
        trailing: isEnd
            ? SvgPicture.asset(
                ArrowDirection.arrowDirectionEnRight(),
                fit: BoxFit.scaleDown,
              )
            : null,
      ),
    );
  }
}
