import 'package:ecommerce_app/core/helper/arrow_direction.dart';
import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/custom_circle_progress_indicator.dart';
import 'package:ecommerce_app/core/widget/custom_list_of_items.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/features/search/manager/search_cubit/search_cubit.dart';
import 'package:ecommerce_app/features/search/manager/search_cubit/search_state.dart';
import 'package:ecommerce_app/features/search/presentation/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorManager.primaryColor,
            toolbarHeight: DeviceWidthHeight.perentageOfHeight(
              HeightManager.h129,
            ),
            leading: InkWell(
              onTap: () {
                RouteManager.backFrom();
              },
              child: SvgPicture.asset(
                ArrowDirection.arrowDirectionEnLeft(),
                fit: BoxFit.scaleDown,
              ),
            ),
            centerTitle: true,
            title: CustomTextField(
              onChanged: SearchCubit.get(context).onChangeText,
            ),
          ),
          body: CustomWhiteBackground(
            child: Padding(
              padding: PaddingManager.paddingHorizontalBody,
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLaoding) {
                    return Center(
                      child: CustomCircleProgressIndicator(),
                    );
                  } else if (state is SearchFailing) {
                    return Center(
                      child: Text(
                        state.errMessage,
                        style: TextStyleManager.regular(
                            size: TextSizeManager.s18,
                            color: ColorManager.redColor),
                      ),
                    );
                  } else if (state is SearchSuccess) {
                    return Column(
                      children: [
                        SizedBox(
                          height: HeightManager.h37,
                        ),

                        // path data to it
                        CustomListOfItems(
                          data: state.data,
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: Text(
                        LanguageGlobaleVar.searchAbout.tr,
                        style: TextStyleManager.regular(
                          size: TextSizeManager.s20,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
