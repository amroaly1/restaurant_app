import 'package:ecommerce_app/features/auth/login/data/repo/login_repo.dart';
import 'package:ecommerce_app/features/auth/login/manager/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInit());
  static LoginCubit get(context) => BlocProvider.of(context);

  // repo
  LoginRepo repo = LoginRepo();

  // form key and autovalidate
  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  // textformfield

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // on tap

  void onTap() async {
    emit(LoginLoading());

    if (globalKey.currentState!.validate()) {
      var response = await repo.login(
          email: emailController.text, password: passwordController.text);
      response.fold((errMessage) => emit(LoginFailing(errMessage: errMessage)),
          (r) {
        if (!isClosed) {
          emit(LoginSuccess());
        }
      });
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(LoginNotValdiateInput());
    }
  }
}
