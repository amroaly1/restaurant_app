import 'dart:ui';

import 'package:ecommerce_app/core/storage/cache_helper.dart';
import 'package:ecommerce_app/core/storage/storage_key.dart';

Locale? getCurrentLanguage() {
  CacheHelper cacheHelper = CacheHelper();
  String? lang = cacheHelper.getDataString(key: StorageKey.language);

  if (lang == null || lang == "en") {
    return Locale("en", "US");
  } else if (lang == "ar") {
    return Locale("ar", "EG");
  }
  return null;
}

void changeCurrentLnaguage(String lan) async {
  CacheHelper cacheHelper = CacheHelper();
  await cacheHelper.saveData(key: StorageKey.language, value: lan);
}
