import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/widget/custom_card_of_item.dart';
import 'package:ecommerce_app/features/menu/presentation/menu_item_view.dart';
import 'package:flutter/material.dart';

class CustomListOfItems extends StatelessWidget {
  const CustomListOfItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: HeightManager.h20),
        child: ListView.separated(
          padding: EdgeInsets.all(0),
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  RouteManager.navigateTo(MenuItemView());
                },
                child: CustomCardOfItem());
          },
          separatorBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: HeightManager.h26,
              ),
              child: Divider(
                color: ColorManager.primaryColor,
              ),
            );
          },
          itemCount: 2,
        ),
      ),
    );
  }
}
