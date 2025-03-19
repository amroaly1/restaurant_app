import 'package:ecommerce_app/core/helper/arrow_direction.dart';
import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/features/auth/login/manager/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/features/auth/login/presentation/widget/log_in_body.dart';
import 'package:ecommerce_app/features/welcome/presentation/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          RouteManager.navigateToAndNoOptionToBack(WelcomeView());
        },
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: DeviceWidthHeight.perentageOfHeight(
              HeightManager.h163,
            ),
            backgroundColor: ColorManager.primaryColor,
            centerTitle: true,
            title: Text(
              LanguageGlobaleVar.loginTitle.tr,
              style: TextStyleManager.bold(
                size: TextSizeManager.s28,
                color: ColorManager.white1Color,
              ),
            ),
            leading: InkWell(
              onTap: () {
                RouteManager.navigateToAndNoOptionToBack(WelcomeView());
              },
              child: SvgPicture.asset(
                ArrowDirection.arrowDirectionEnLeft(),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          body: const LogInBody(),
        ),
      ),
    );
  }
}
