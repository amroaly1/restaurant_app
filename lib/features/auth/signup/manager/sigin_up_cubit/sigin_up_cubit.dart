import 'package:ecommerce_app/core/helper/app_validator.dart';
import 'package:ecommerce_app/features/auth/signup/data/repo/sign_up_repo.dart';
import 'package:ecommerce_app/features/auth/signup/manager/sigin_up_cubit/sigin_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SiginUpCubit extends Cubit<SiginUpState> {
  SiginUpCubit() : super(SiginUpInit());

  static SiginUpCubit get(context) => BlocProvider.of(context);

  // take instance from signup repo

  SignUpRepo repo = SignUpRepo();

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

  void onTap() async {
    emit(SiginUpLoading());
    if (globalKey.currentState!.validate()) {
      var resp = await repo.signUp(
          fullName: fullNameController.text,
          email: emailController.text,
          mobile: phoneNumberController.text,
          password: passwordController.text);
      resp.fold((errMessage) => emit(SiginUpFailing(errMessage: errMessage)),
          (sucess) => emit(SiginUpSuccess(message: sucess)));
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(SiginUpNotValidateInput());
    }
  }
}
