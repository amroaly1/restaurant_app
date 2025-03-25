import 'package:ecommerce_app/core/helper/get_current_language.dart';
import 'package:ecommerce_app/core/localization/languages.dart';
import 'package:ecommerce_app/core/storage/cache_helper.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/font_family_manager.dart';
import 'package:ecommerce_app/features/home/presentation/home_view.dart';
import 'package:ecommerce_app/features/on_boarding/presentation/on_bording_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/storage/storage_key.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: getCurrentLanguage(),
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorManager.primaryColor,
        fontFamily: FontFamilyManager.leagueSpartan,
        useMaterial3: true,
      ),
      home: CacheHelper().getDataString(key: StorageKey.accesstoken) != null
          ? HomeView()
          : OnBordingView(),
    );
  }
}
