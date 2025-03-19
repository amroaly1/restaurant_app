import 'package:ecommerce_app/core/manager/text_form_field_cubit/cubit/text_form_field_cubit.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.isAuth = false,
    this.keyboardType,
  });
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isAuth;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextFormFieldCubit(isAuth: isAuth),
      child: BlocBuilder<TextFormFieldCubit, TextFormFieldState>(
        builder: (context, state) {
          return TextFormField(
            controller: controller,
            validator: validator,
            style: TextStyleManager.regular(
              size: TextSizeManager.s20,
            ),
            obscureText: TextFormFieldCubit.get(context).obscure,
            obscuringCharacter: "*",
            keyboardType: keyboardType,
            decoration: InputDecoration(
              contentPadding: PaddingManager.textFormFieldPadding,
              filled: true,
              fillColor: ColorManager.yellowColor,
              border: outlineInputBoarder(),
              enabledBorder: outlineInputBoarder(),
              focusedBorder:
                  outlineInputBoarder(boarderColor: ColorManager.blueColor),
              disabledBorder:
                  outlineInputBoarder(boarderColor: ColorManager.greyColor),
              errorBorder:
                  outlineInputBoarder(boarderColor: ColorManager.redColor),
              focusedErrorBorder:
                  outlineInputBoarder(boarderColor: ColorManager.blueColor),
              hintText: hintText,
              hintStyle: TextStyleManager.thin(
                size: TextSizeManager.s17,
              ),
              errorMaxLines: 3,
              errorStyle: TextStyleManager.thin(
                size: TextSizeManager.s14,
                color: ColorManager.redColor,
                overFow: TextOverflow.visible,
              ),
              suffixIcon: TextFormFieldCubit.get(context).currentIcon(),
            ),
          );
        },
      ),
    );
  }

  OutlineInputBorder outlineInputBoarder(
      {Color boarderColor = ColorManager.yellowColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(RaduisManager.r13),
      borderSide: BorderSide(
        color: boarderColor,
      ),
    );
  }
}
