import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/features/home/manager/home_cubit/home_state.dart';
import 'package:ecommerce_app/features/home/presentation/home_data_view.dart';
import 'package:ecommerce_app/features/home/presentation/menu_view.dart';
import 'package:ecommerce_app/features/profile/presentation/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screensList = const [
    HomeDataView(),
    MenuView(),
    ProfileView(),
  ];

  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(HomeChangePage());
  }

  Color iconColor(int index) {
    return index == currentIndex
        ? ColorManager.primaryColor
        : ColorManager.whiteColor;
  }

  Widget currentPage() {
    return screensList[currentIndex];
  }
}
