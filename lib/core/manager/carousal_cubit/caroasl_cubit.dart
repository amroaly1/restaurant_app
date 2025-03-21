import 'dart:async';

import 'package:ecommerce_app/core/manager/carousal_cubit/carosal_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaroaslCubit extends Cubit<CarosalState> {
  CaroaslCubit() : super(CarosalInit());

  static CaroaslCubit get(context) => BlocProvider.of(context);
  PageController pageController = PageController();
  int currentIndex = 0;
  static late Timer _timer;
  static void disposeTimer() {
    _timer.cancel();
  }

  void onIndexChage(int index) {
    currentIndex = index;
    emit(CarosalChangeIndex());
  }

  void repeate() {
    _timer = Timer.periodic(
      Duration(seconds: 10),
      (t) {
        currentIndex = pageController.page?.toInt() ?? 0;
        if (currentIndex == (5 - 1)) {
          currentIndex = 0;
          pageController.animateToPage(currentIndex,
              duration: Duration(milliseconds: 500), curve: Curves.easeOut);
        } else {
          currentIndex++;
          pageController.animateToPage(currentIndex,
              duration: Duration(milliseconds: 500), curve: Curves.linear);
        }
      },
    );
  }
}
