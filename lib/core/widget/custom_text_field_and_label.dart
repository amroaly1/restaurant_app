import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/core/widget/default_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomTextFieldAndLabel extends StatelessWidget {
  const CustomTextFieldAndLabel(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.controller,
      this.validator,
      this.isAuth = false});
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isAuth;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: HeightManager.h5,
      children: [
        Text(
          labelText,
          style: TextStyleManager.meduim(size: TextSizeManager.s20),
        ),
        DefaultTextFormField(
          hintText: hintText,
          controller: controller,
          validator: validator,
          isAuth: isAuth,
        ),
      ],
    );
  }
}
