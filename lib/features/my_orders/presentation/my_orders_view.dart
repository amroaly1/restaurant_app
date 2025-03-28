import 'package:ecommerce_app/core/helper/arrow_direction.dart';
import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/features/my_orders/manager/my_order_cubit/my_order_cubit.dart';
import 'package:ecommerce_app/features/my_orders/presentation/widget/my_order_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: MyOrderCubit()..getOrder(),
      child: RefreshIndicator(
        onRefresh: () async {
          MyOrderCubit().getOrder();
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
              LanguageGlobaleVar.myOrders.tr,
              style: TextStyleManager.bold(
                size: TextSizeManager.s28,
                color: ColorManager.whiteColor,
              ),
            ),
          ),
          body: MyOrderBody(),
        ),
      ),
    );
  }
}
