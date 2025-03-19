import 'package:ecommerce_app/core/constant/constant.dart';
import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/widget/custom_text_field_and_label.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/core/widget/default_button.dart';
import 'package:flutter/material.dart';
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
        padding: PaddingManager.authBodyPadding,
        child: SingleChildScrollView(
          child: Column(
            spacing: HeightManager.h22,
            children: [
              CustomTextFieldAndLabel(
                labelText: LanguageGlobaleVar.fullname.tr,
                hintText: LanguageGlobaleVar.enterFullnamehere.tr,
              ),
              CustomTextFieldAndLabel(
                labelText: LanguageGlobaleVar.email.tr,
                hintText: LanguageGlobaleVar.enterEmailHere.tr,
              ),
              CustomTextFieldAndLabel(
                labelText: LanguageGlobaleVar.mobileNumber.tr,
                hintText: phoneHint,
              ),
              CustomTextFieldAndLabel(
                labelText: LanguageGlobaleVar.password.tr,
                hintText: passwordHint,
                isAuth: true,
              ),
              CustomTextFieldAndLabel(
                labelText: LanguageGlobaleVar.confirmPassword.tr,
                hintText: passwordHint,
                isAuth: true,
              ),
              SizedBox(height: HeightManager.h15),
              Center(
                child: DefaultButton(
                  text: LanguageGlobaleVar.signUp.tr,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
