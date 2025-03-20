import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/features/menu/data/repo/category_repo.dart';
import 'package:ecommerce_app/features/menu/manager/menu_cubit/menu_cubit.dart';
import 'package:ecommerce_app/features/menu/manager/menu_cubit/menu_state.dart';
import 'package:ecommerce_app/features/menu/presentation/widget/custom_card_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return BlocBuilder<MenuCubit, MenuState>(
            builder: (context, state) {
              return InkWell(
                onTap: () => MenuCubit.get(context).selectCategory(index),
                child: CustomCardCategory(
                  isActive: MenuCubit.get(context).isSelect(index),
                  categoryModel: CategoryRepo.categorys[index],
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: WidthManager.w18);
        },
      ),
    );
  }
}
