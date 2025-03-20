import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/asset_icon_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/features/menu/data/model/category_model.dart';
import 'package:ecommerce_app/features/menu/data/repo/category_repo.dart';
import 'package:ecommerce_app/features/menu/presentation/widget/custom_card_category.dart';
import 'package:flutter/material.dart';

class CustomCategorySection extends StatelessWidget {
  const CustomCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceWidthHeight.perentageOfHeight(HeightManager.h90),
      child: ListView.separated(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomCardCategory(
            isActive: index == 0,
            categoryModel: CategoryRepo.categorys[index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: WidthManager.w18);
        },
      ),
    );
  }
}
