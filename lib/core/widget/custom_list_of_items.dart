import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/widget/custom_card_of_item.dart';
import 'package:ecommerce_app/features/home/data/model/product_model.dart';
import 'package:ecommerce_app/features/menu/presentation/menu_item_view.dart';
import 'package:flutter/material.dart';

class CustomListOfItems extends StatelessWidget {
  const CustomListOfItems({
    super.key,
    required this.data,
  });
  final List<ProductModel> data;
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
                  RouteManager.navigateTo(MenuItemView(
                    product: data[index],
                  ));
                },
                child: CustomCardOfItem(
                  product: data[index],
                ));
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
          itemCount: data.length,
        ),
      ),
    );
  }
}
