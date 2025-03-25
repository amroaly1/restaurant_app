import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/model/my_card_model.dart';
import 'package:ecommerce_app/core/utils/asset_icon_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/features/card/manager/card_cubit/card_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCardItem extends StatelessWidget {
  const CustomCardItem({
    super.key,
    required this.card,
  });
  final MyCardModel card;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceWidthHeight.perentageOfHeight(
        HeightManager.h80,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: DeviceWidthHeight.perentageOfHeight(
                  HeightManager.h80,
                ),
                width: DeviceWidthHeight.perentageOfWidth(
                  WidthManager.w98,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    RaduisManager.r20,
                  ),
                ),
                child: Image.network(
                  card.product.imagePath,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: WidthManager.w12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card.product.name,
                    style: TextStyleManager.meduim(
                      size: TextSizeManager.s20,
                    ),
                  ),
                  SizedBox(
                    height: HeightManager.h5,
                  ),
                  Text(
                    "\$${card.product.price}",
                    style: TextStyleManager.light(
                      size: TextSizeManager.s14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => CardCubit.get(context).delete(card),
                child: SvgPicture.asset(
                  AssetIconManager.deleteicon,
                ),
              ),
              Row(
                spacing: WidthManager.w7,
                children: [
                  ButtonAddOrRemove(
                    icon: Icons.remove,
                    onTap: () {
                      CardCubit.get(context).decrease(card);
                    },
                  ),
                  Text(
                    card.count.toString(),
                    style: TextStyleManager.regular(
                      size: TextSizeManager.s18,
                    ),
                  ),
                  ButtonAddOrRemove(
                    icon: Icons.add,
                    onTap: () {
                      CardCubit.get(context).increase(card);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ButtonAddOrRemove extends StatelessWidget {
  const ButtonAddOrRemove({
    super.key,
    this.onTap,
    required this.icon,
  });
  final void Function()? onTap;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: WidthManager.w18,
        height: HeightManager.h18,
        decoration: BoxDecoration(
          color: ColorManager.secondaryColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: ColorManager.whiteColor,
          size: HeightManager.h12,
        ),
      ),
    );
  }
}
