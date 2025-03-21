import 'dart:developer';

import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

part 'text_form_field_state.dart';

class TextFormFieldCubit extends Cubit<TextFormFieldState> {
  TextFormFieldCubit({this.isAuth = false}) : super(TextFormFieldInitial()) {
    if (isAuth) {
      obscure = true;
    }
  }

  static TextFormFieldCubit get(context) => BlocProvider.of(context);

  late bool isAuth;

  bool obscure = false;

  void changeObscure() {
    obscure = !obscure;
    log("change $obscure");
    emit(TextFormFieldChangeObscure());
  }

  Widget? currentIcon() {
    if (isAuth) {
      if (obscure) {
        return IconButton(
          onPressed: () {
            changeObscure();
          },
          icon: Icon(
            Icons.visibility_off,
            color: ColorManager.secondaryColor,
          ),
        );
      } else {
        return IconButton(
          onPressed: () {
            changeObscure();
          },
          icon: Icon(
            Icons.visibility,
            color: ColorManager.secondaryColor,
          ),
        );
      }
    } else {
      return null;
    }
  }
}
