import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/custom_circle_progress_indicator.dart';
import 'package:ecommerce_app/core/widget/custom_search_and_card_shooping.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/features/menu/manager/menu_cubit/menu_cubit.dart';
import 'package:ecommerce_app/features/menu/manager/menu_cubit/menu_state.dart';
import 'package:ecommerce_app/features/menu/presentation/widget/custom_category_section.dart';
import 'package:ecommerce_app/core/widget/custom_list_of_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubit(),
      child: Column(
        children: [
          SizedBox(
            height: DeviceWidthHeight.perentageOfHeight(HeightManager.h116),
            child: Padding(
              padding: PaddingManager.paddingHorizontalBody,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomSearchAndCardShooping(),
                ],
              ),
            ),
          ),
          Expanded(
            child: CustomWhiteBackground(
              child: Padding(
                padding: PaddingManager.paddingHorizontalBody,
                child: BlocBuilder<MenuCubit, MenuState>(
                  builder: (context, state) {
                    if (state is MenuGetDataLoading) {
                      return Center(
                        child: CustomCircleProgressIndicator(),
                      );
                    } else if (state is MenuGetDataFailing) {
                      return Center(
                        child: Text(
                          state.errMessage,
                          style: TextStyleManager.semiBoald(
                              size: TextSizeManager.s17,
                              color: ColorManager.redColor),
                        ),
                      );
                    }
                    return Column(
                      children: [
                        SizedBox(
                          height: HeightManager.h26,
                        ),
                        CustomCategorySection(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: HeightManager.h12,
                          ),
                          child: Divider(
                            color: ColorManager.primaryColor,
                          ),
                        ),
                        // path data to this
                        CustomListOfItems(
                          data: MenuCubit.get(context).curentList(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
