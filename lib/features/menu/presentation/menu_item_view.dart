import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/utils/asset_icon_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/features/home/data/model/product_model.dart';
import 'package:ecommerce_app/features/menu/manager/menu_item_cubit/menu_item_cubit.dart';
import 'package:ecommerce_app/features/menu/manager/menu_item_cubit/menu_item_state.dart';
import 'package:ecommerce_app/features/menu/presentation/widget/custom_icon_add_or_remove.dart';
import 'package:ecommerce_app/features/menu/presentation/widget/custom_item_data_view_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MenuItemView extends StatelessWidget {
  const MenuItemView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuItemCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Column(
            children: [
              CustomItemDataViewAppBar(
                product: product,
              ),
              Expanded(
                child: CustomWhiteBackground(
                  child: Padding(
                    padding: PaddingManager.paddingHorizontalBody,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: HeightManager.h37),
                        Container(
                          height: DeviceWidthHeight.perentageOfHeight(
                              HeightManager.h280),
                          width: double.infinity,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              RaduisManager.r30,
                            ),
                          ),
                          child: Image.network(
                            product.imagePath,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: HeightManager.h30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${product.price}",
                              style: TextStyleManager.bold(
                                size: TextSizeManager.s24,
                                color: ColorManager.secondaryColor,
                              ),
                            ),
                            Row(
                              spacing: WidthManager.w15,
                              children: [
                                BlocBuilder<MenuItemCubit, MenuItemState>(
                                  builder: (context, state) {
                                    return CustomIconAddOrRemove(
                                      icon: Icons.remove,
                                      onTap: MenuItemCubit.get(context)
                                          .decreaseItem,
                                      isActive: MenuItemCubit.get(context)
                                          .canDecrease(),
                                    );
                                  },
                                ),
                                BlocBuilder<MenuItemCubit, MenuItemState>(
                                  builder: (context, state) {
                                    return Text(
                                      "${MenuItemCubit.get(context).count}",
                                      style: TextStyleManager.regular(
                                        size: TextSizeManager.s24,
                                      ),
                                    );
                                  },
                                ),
                                CustomIconAddOrRemove(
                                  icon: Icons.add,
                                  onTap:
                                      MenuItemCubit.get(context).increaseItem,
                                  isActive: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: HeightManager.h16,
                          ),
                          child: Divider(
                            color: ColorManager.primaryColor,
                          ),
                        ),
                        Text(
                          product.description,
                          style: TextStyleManager.regular(
                              size: TextSizeManager.s16),
                        ),
                        SizedBox(
                          height: HeightManager.h61,
                        ),
                        InkWell(
                          onTap: () =>
                              MenuItemCubit.get(context).addToCard(product),
                          child: Center(
                            child: Container(
                              width: DeviceWidthHeight.perentageOfWidth(
                                  WidthManager.w181),
                              decoration: BoxDecoration(
                                color: ColorManager.secondaryColor,
                                borderRadius: BorderRadius.circular(
                                  RaduisManager.r30,
                                ),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AssetIconManager.addToCard,
                                    ),
                                    SizedBox(width: WidthManager.w5),
                                    Text(
                                      LanguageGlobaleVar.addtoCart.tr,
                                      style: TextStyleManager.meduim(
                                        size: TextSizeManager.s20,
                                        color: ColorManager.whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
