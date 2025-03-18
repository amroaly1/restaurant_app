import 'dart:developer';

import 'package:ecommerce_app/core/helper/arrow_direction.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/features/on_boarding/manager/on_bording_cubit/on_bording_state.dart';
import 'package:ecommerce_app/features/welcome/presentation/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingCubit extends Cubit<OnBordingState> {
  OnBoardingCubit() : super(OnBoardingInit());
  static OnBoardingCubit get(context) => BlocProvider.of(context);
  PageController pageController = PageController();

  void goToNextPage() {
    int currentIndex = pageController.page?.round() ?? 0;
    log(currentIndex.toString());
    if (currentIndex < 2) {
      pageController.animateToPage(
        currentIndex + 1,
        duration: Duration(milliseconds: 650),
        curve: Curves.linear,
      );
      // pageController.jumpToPage(currentIndex + 1);
    } else {
      goToWelcomScreen();
    }
  }

  void goToWelcomScreen() {
    // toDo go to wellocm screen
    RouteManager.navigateToAndNoOptionToBack(WelcomeView());
  }

  String arrowDirection() {
    return ArrowDirection.arrowDirectionEnRight();
  }
}
