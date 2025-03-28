import 'package:ecommerce_app/core/helper/arrow_direction.dart';
import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/utils/asset_icon_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/font_family_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/custom_circle_progress_indicator.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/features/my_favorites/data/model/my_favorite_model.dart';
import 'package:ecommerce_app/features/my_favorites/manager/my_favorite_cubit/my_favorite_cubit.dart';
import 'package:ecommerce_app/features/my_favorites/manager/my_favorite_cubit/my_favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyFavoritesView extends StatelessWidget {
  const MyFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyFavoriteCubit(),
      child: Builder(builder: (context) {
        return RefreshIndicator(
          onRefresh: () async {
            MyFavoriteCubit.get(context).getData();
          },
          child: Scaffold(
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
              title: Text(
                LanguageGlobaleVar.myFavorites.tr,
                style: TextStyleManager.bold(
                  size: TextSizeManager.s28,
                  color: ColorManager.whiteColor,
                ),
              ),
            ),
            body: CustomWhiteBackground(
              child: Padding(
                padding: PaddingManager.paddingHorizontalBody,
                child: BlocBuilder<MyFavoriteCubit, MyFavoriteState>(
                  builder: (context, state) {
                    if (state is MyFavoriteLaoding) {
                      return Center(
                        child: CustomCircleProgressIndicator(),
                      );
                    } else if (state is MyFavoriteFailing) {
                      return Center(
                        child: Text(
                          state.errMessage,
                          style: TextStyleManager.bold(
                            size: TextSizeManager.s20,
                            color: ColorManager.redColor,
                          ),
                        ),
                      );
                    } else if (state is MyFavoriteSuccess) {
                      return Column(
                        children: [
                          SizedBox(
                            height: HeightManager.h37,
                          ),
                          CustomListOfItems(
                            data: state.favorites.data,
                          )
                        ],
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

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
                onTap: () {},
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

class CustomCardOfItem extends StatelessWidget {
  const CustomCardOfItem({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          height: DeviceWidthHeight.perentageOfHeight(174),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              RaduisManager.r35,
            ),
          ),
          child: Image.network(
            product.imagePath,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: HeightManager.h10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              spacing: WidthManager.w12,
              children: [
                Text(
                  product.name,
                  style: TextStyleManager.semiBoald(
                    size: TextSizeManager.s18,
                    fontfamily: FontFamilyManager.poppins,
                  ),
                ),
                Center(
                  child: Container(
                    height: HeightManager.h5,
                    width: WidthManager.w5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.secondaryColor,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: WidthManager.w5,
                    right: WidthManager.w5,
                    top: HeightManager.h3,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorManager.secondaryColor,
                    borderRadius: BorderRadius.circular(
                      RaduisManager.r30,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.rating.toString(),
                        style: TextStyleManager.regular(
                          size: TextSizeManager.s16,
                          height: 0,
                          color: ColorManager.whiteColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: WidthManager.w4),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: SvgPicture.asset(
                          AssetIconManager.star,
                          height: HeightManager.h12,
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Text(
              "\$${product.price}",
              style: TextStyleManager.regular(
                size: TextSizeManager.s18,
                color: ColorManager.secondaryColor,
              ),
            )
          ],
        ),
        Text(
          product.description,
          style: TextStyleManager.light(
            size: TextSizeManager.s12,
          ),
        )
      ],
    );
  }
}
