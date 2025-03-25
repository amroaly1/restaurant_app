import 'dart:developer';
import 'dart:ui';

import 'package:ecommerce_app/core/helper/get_current_language.dart';
import 'package:ecommerce_app/features/settings/manager/setting_cubit/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());
  static SettingCubit get(context) => BlocProvider.of(context);

  void changeLanguageToArabic() {
    if (Get.locale!.languageCode != "ar") {
      log(Get.locale!.languageCode);
      Get.updateLocale(
        Locale("ar", "EG"),
      );
      changeCurrentLnaguage("ar");
      emit(SettingChangeLanguage());
    }
  }

  void changeLanguageToEnglish() {
    if (Get.locale!.languageCode != "en") {
      log(Get.locale!.languageCode);
      Get.updateLocale(
        Locale("en", "US"),
      );
      changeCurrentLnaguage("en");
      emit(SettingChangeLanguage());
    }
  }
}
