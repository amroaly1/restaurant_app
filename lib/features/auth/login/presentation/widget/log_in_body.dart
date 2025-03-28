import 'package:ecommerce_app/core/constant/constant.dart';
import 'package:ecommerce_app/core/helper/app_message.dart';
import 'package:ecommerce_app/core/helper/app_validator.dart';
import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/custom_circle_progress_indicator.dart';
import 'package:ecommerce_app/core/widget/custom_text_field_and_label.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/core/widget/default_button.dart';
import 'package:ecommerce_app/features/auth/login/manager/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/features/auth/login/manager/login_cubit/login_state.dart';
import 'package:ecommerce_app/features/home/presentation/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LogInBody extends StatelessWidget {
  const LogInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomWhiteBackground(
      height: DeviceWidthHeight.perentageOfHeight(
        HeightManager.h689,
      ),
      child: Padding(
        padding: PaddingManager.authBodyPadding,
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginFailing) {
              AppMessage.showMessage1(
                  title: LanguageGlobaleVar.error.tr, body: state.errMessage);
            } else if (state is LoginSuccess) {
              RouteManager.navigateToAndNoOptionToBack(HomeView());
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                key: LoginCubit.get(context).globalKey,
                autovalidateMode: LoginCubit.get(context).autovalidateMode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: HeightManager.h22,
                  children: [
                    Text(
                      LanguageGlobaleVar.welcome.tr,
                      style: TextStyleManager.semiBoald(
                        size: TextSizeManager.s24,
                      ),
                    ),
                    SizedBox(),
                    CustomTextFieldAndLabel(
                      labelText: LanguageGlobaleVar.email.tr,
                      hintText: LanguageGlobaleVar.enterEmailHere.tr,
                      controller: LoginCubit.get(context).emailController,
                      validator: AppValidator.emailValidator,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomTextFieldAndLabel(
                      labelText: LanguageGlobaleVar.password.tr,
                      hintText: passwordHint,
                      isAuth: true,
                      controller: LoginCubit.get(context).passwordController,
                      validator: AppValidator.passwordValidator,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: HeightManager.h15),
                    Center(
                      child: state is LoginSuccess
                          ? CustomCircleProgressIndicator()
                          : DefaultButton(
                              text: LanguageGlobaleVar.login.tr,
                              onPressed: LoginCubit.get(context).onTap,
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
