import 'dart:async';

import 'package:ecommerce_app/core/manager/carousal_cubit/carosal_state.dart';
import 'package:ecommerce_app/features/home/data/model/slider_model.dart';
import 'package:ecommerce_app/features/home/data/repo/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaroaslCubit extends Cubit<CarosalState> {
  CaroaslCubit() : super(CarosalInit()) {
    getData();
  }

  static CaroaslCubit get(context) => BlocProvider.of(context);
  HomeRepo homeRepo = HomeRepo();
  List<SliderModel> data = [];
  static bool isStart = true;
  void getData() async {
    emit(CarosalGetDataLoading());

    var response = await homeRepo.getSliders();

    response.fold(
        (errorMessage) => emit(CarosalGetDataFailure(errMessage: errorMessage)),
        (respose) {
      repeate();
      data = respose;
      emit(CarosalGetDataSucess(data: data));
    });
  }

  PageController pageController = PageController();
  int currentIndex = 0;
  static Timer? _timer;

  void onIndexChage(int index) {
    currentIndex = index;
    emit(CarosalChangeIndex());
  }

  int getCurrentIndex() {
    if (pageController.hasClients) {
      return (pageController.page?.round()) ?? 0;
    } else {
      return 0;
    }
  }

  int getLenght() {
    return data.length <= 5 ? data.length : 5;
  }

  void repeate() {
    if (_timer?.isActive ?? false) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(
      Duration(seconds: 10),
      (t) {
        if (pageController.hasClients) {
          currentIndex = pageController.page?.toInt() ?? 0;
          emit(CarosalChangePage());
        }

        if (currentIndex == (getLenght() - 1)) {
          currentIndex = 0;
          if (pageController.hasClients) {
            pageController.animateToPage(currentIndex,
                duration: Duration(milliseconds: 500), curve: Curves.easeOut);
            emit(CarosalChangePage());
          }
        } else {
          currentIndex++;
          if (pageController.hasClients) {
            pageController.animateToPage(currentIndex,
                duration: Duration(milliseconds: 500), curve: Curves.linear);
            emit(CarosalChangePage());
          }
        }
      },
    );
  }
}
