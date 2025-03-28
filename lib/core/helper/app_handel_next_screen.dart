import 'package:ecommerce_app/core/storage/cache_helper.dart';
import 'package:ecommerce_app/core/storage/storage_key.dart';
import 'package:ecommerce_app/features/home/presentation/home_view.dart';
import 'package:ecommerce_app/features/on_boarding/presentation/on_bording_view.dart';
import 'package:ecommerce_app/features/welcome/presentation/welcome_view.dart';
import 'package:flutter/material.dart';

Widget handelNexyScreen() {
  bool? visitOnBoarding =
      CacheHelper().getBool(key: StorageKey.isVisitOnBoarding);
  bool? isLogin = CacheHelper().getBool(key: StorageKey.isLogin);

  if (visitOnBoarding ?? false) {
    if (isLogin ?? false) {
      return HomeView();
    } else {
      return WelcomeView();
    }
  } else {
    return OnBordingView();
  }
}
