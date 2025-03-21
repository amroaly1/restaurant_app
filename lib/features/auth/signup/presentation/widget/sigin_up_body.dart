import 'package:ecommerce_app/core/constant/constant.dart';
import 'package:ecommerce_app/core/helper/app_message.dart';
import 'package:ecommerce_app/core/helper/app_validator.dart';
import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/custom_circle_progress_indicator.dart';
import 'package:ecommerce_app/core/widget/custom_text_field_and_label.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/core/widget/default_button.dart';
import 'package:ecommerce_app/features/auth/login/presentation/log_in_view.dart';
import 'package:ecommerce_app/features/auth/signup/manager/sigin_up_cubit/sigin_up_cubit.dart';
import 'package:ecommerce_app/features/auth/signup/manager/sigin_up_cubit/sigin_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SiginUpBody extends StatelessWidget {
  const SiginUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomWhiteBackground(
      height: DeviceWidthHeight.perentageOfHeight(
        HeightManager.h689,
      ),
      child: Padding(
        padding: PaddingManager.paddingHorizontalBody,
        child: SingleChildScrollView(
          child: BlocConsumer<SiginUpCubit, SiginUpState>(
            listener: (context, state) {
              if (state is SiginUpFailing) {
                AppMessage.showMessage1(
                    title: LanguageGlobaleVar.error.tr, body: state.errMessage);
              } else if (state is SiginUpSuccess) {
                AppMessage.showMessage2(
                    title: LanguageGlobaleVar.success.tr, body: state.message);
                RouteManager.navigateToAndNoOptionToBack(LogInView());
              }
            },
            builder: (context, state) {
              return Form(
                key: SiginUpCubit.get(context).globalKey,
                autovalidateMode: SiginUpCubit.get(context).autovalidateMode,
                child: Column(
                  spacing: HeightManager.h22,
                  children: [
                    SizedBox(height: HeightManager.h12),
                    CustomTextFieldAndLabel(
                      labelText: LanguageGlobaleVar.fullname.tr,
                      hintText: LanguageGlobaleVar.enterFullnamehere.tr,
                      controller: SiginUpCubit.get(context).fullNameController,
                      validator: AppValidator.fullNameValidator,
                      keyboardType: TextInputType.text,
                    ),
                    CustomTextFieldAndLabel(
                      labelText: LanguageGlobaleVar.email.tr,
                      hintText: LanguageGlobaleVar.enterEmailHere.tr,
                      controller: SiginUpCubit.get(context).emailController,
                      validator: AppValidator.emailValidator,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomTextFieldAndLabel(
                      labelText: LanguageGlobaleVar.mobileNumber.tr,
                      hintText: phoneHint,
                      controller:
                          SiginUpCubit.get(context).phoneNumberController,
                      validator: AppValidator.mobileNumberValidator,
                      keyboardType: TextInputType.phone,
                    ),
                    CustomTextFieldAndLabel(
                      labelText: LanguageGlobaleVar.password.tr,
                      hintText: passwordHint,
                      isAuth: true,
                      controller: SiginUpCubit.get(context).passwordController,
                      validator: AppValidator.passwordValidator,
                      keyboardType: TextInputType.text,
                    ),
                    CustomTextFieldAndLabel(
                      labelText: LanguageGlobaleVar.confirmPassword.tr,
                      hintText: passwordHint,
                      isAuth: true,
                      controller:
                          SiginUpCubit.get(context).confirmPasswordController,
                      validator:
                          SiginUpCubit.get(context).confirmPasswordValidator,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: HeightManager.h15),
                    Center(
                      child: state is SiginUpLoading
                          ? CustomCircleProgressIndicator()
                          : DefaultButton(
                              text: LanguageGlobaleVar.signUp.tr,
                              onPressed: SiginUpCubit.get(context).onTap,
                            ),
                    ),

                    // ToDo Convert This String to Be Translate
                    Padding(
                      padding: const EdgeInsets.only(top: HeightManager.h10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            LanguageGlobaleVar.privacy1.tr,
                            style: TextStyleManager.thin(
                                size: TextSizeManager.s12),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                LanguageGlobaleVar.privacy2.tr,
                                style: TextStyleManager.meduim(
                                    size: TextSizeManager.s12,
                                    color: ColorManager.secondaryColor),
                              ),
                              Text(
                                LanguageGlobaleVar.and.tr,
                                style: TextStyleManager.thin(
                                  size: TextSizeManager.s12,
                                ),
                              ),
                              Text(
                                LanguageGlobaleVar.privacy3.tr,
                                style: TextStyleManager.meduim(
                                    size: TextSizeManager.s12,
                                    color: ColorManager.secondaryColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: HeightManager.h12),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
