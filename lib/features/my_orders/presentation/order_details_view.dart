import 'package:ecommerce_app/core/helper/arrow_direction.dart';
import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/features/my_orders/data/model/order_type_model.dart';
import 'package:ecommerce_app/features/my_orders/manager/my_order_cubit/my_order_cubit.dart';
import 'package:ecommerce_app/features/my_orders/presentation/widget/order_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({
    super.key,
    this.isComplete = false,
    required this.order,
  });
  final bool isComplete;
  final OrderTypeModel order;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: MyOrderCubit(),
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
            LanguageGlobaleVar.orderDetails.tr,
            style: TextStyleManager.bold(
              size: TextSizeManager.s28,
              color: ColorManager.whiteColor,
            ),
          ),
        ),
        body: CustomWhiteBackground(
          child: OrderDetailsBody(
            order: order,
            isComplete: isComplete,
          ),
        ),
      ),
    );
  }
}
