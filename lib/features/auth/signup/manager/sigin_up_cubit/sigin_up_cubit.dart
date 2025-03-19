import 'package:ecommerce_app/core/helper/app_validator.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/features/auth/login/presentation/log_in_view.dart';
import 'package:ecommerce_app/features/auth/signup/manager/sigin_up_cubit/sigin_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SiginUpCubit extends Cubit<SiginUpState> {
  SiginUpCubit() : super(SiginUpInit());

  static SiginUpCubit get(context) => BlocProvider.of(context);

  // form State
  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  // text form field controller

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // validator
  String? confirmPasswordValidator(String? value) {
    return AppValidator.confirmPasswordValidator(
        value, passwordController.text);
  }

  void onTap() {
    emit(SiginUpLoading());
    if (globalKey.currentState!.validate()) {
      // success
      RouteManager.navigateToAndNoOptionToBack(LogInView());
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(SiginUpNotValidateInput());
    }
  }
}
