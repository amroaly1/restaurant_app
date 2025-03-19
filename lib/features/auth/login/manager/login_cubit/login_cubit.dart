import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/features/auth/login/manager/login_cubit/login_state.dart';
import 'package:ecommerce_app/features/home/presentation/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInit());
  static LoginCubit get(context) => BlocProvider.of(context);

  // form key and autovalidate
  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  // textformfield

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // on tap

  void onTap() {
    emit(LoginLoading());

    if (globalKey.currentState!.validate()) {
      // success
      RouteManager.navigateToAndNoOptionToBack(HomeView());
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(LoginNotValdiateInput());
    }
  }
}
