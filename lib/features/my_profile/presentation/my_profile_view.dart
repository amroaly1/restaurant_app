import 'package:ecommerce_app/core/helper/app_message.dart';
import 'package:ecommerce_app/core/helper/app_validator.dart';
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
import 'package:ecommerce_app/core/widget/custom_text_field_and_label.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/core/widget/cutsom_image_picker.dart';
import 'package:ecommerce_app/core/widget/default_button.dart';
import 'package:ecommerce_app/features/my_profile/manager/my_profile_cubit.dart';
import 'package:ecommerce_app/features/my_profile/manager/my_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyProfileCubit(),
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
            LanguageGlobaleVar.myProfile.tr,
            style: TextStyleManager.bold(
              size: TextSizeManager.s28,
              color: ColorManager.whiteColor,
            ),
          ),
        ),
        body: CustomWhiteBackground(
          child: Padding(
            padding: PaddingManager.paddingHorizontalBody,
            child: BlocConsumer<MyProfileCubit, MyProfileState>(
              listener: (context, state) {
                if (state is MyProfileFailing) {
                  AppMessage.showMessage1(
                      title: LanguageGlobaleVar.error.tr,
                      body: state.errMessage);
                } else if (state is MyProfileSuccess) {
                  AppMessage.showMessage2(
                      title: LanguageGlobaleVar.success.tr,
                      body: state.message);
                }
              },
              builder: (context, state) {
                return Form(
                  key: MyProfileCubit.get(context).globalKey,
                  autovalidateMode:
                      MyProfileCubit.get(context).autovalidateMode,
                  child: Column(
                    spacing: HeightManager.h27,
                    children: [
                      SizedBox(),
                      CutsomImagePicker(
                        onSelected: MyProfileCubit.get(context).updateImage,
                      ),
                      CustomTextFieldAndLabel(
                        labelText: LanguageGlobaleVar.fullname.tr,
                        hintText: LanguageGlobaleVar.fullname.tr,
                        validator: AppValidator.fullNameValidator,
                        controller:
                            MyProfileCubit.get(context).fullNameController,
                      ),
                      CustomTextFieldAndLabel(
                        labelText: LanguageGlobaleVar.mobileNumber.tr,
                        hintText: LanguageGlobaleVar.mobileNumber.tr,
                        validator: AppValidator.mobileNumberValidator,
                        controller:
                            MyProfileCubit.get(context).mobileNumberController,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: HeightManager.h10),
                        child: state is MyProfileLoading
                            ? CustomCircleProgressIndicator()
                            : DefaultButton(
                                text: LanguageGlobaleVar.update.tr,
                                onPressed: MyProfileCubit.get(context).onTap,
                              ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
