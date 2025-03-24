import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/storage/cache_helper.dart';
import 'package:ecommerce_app/core/storage/storage_key.dart';
import 'package:ecommerce_app/core/utils/asset_icon_manager.dart';
import 'package:ecommerce_app/features/my_favorites/presentation/my_favorites_view.dart';
import 'package:ecommerce_app/features/my_orders/presentation/my_orders_view.dart';
import 'package:ecommerce_app/features/my_profile/presentation/my_profile_view.dart';
import 'package:ecommerce_app/features/profile/data/model/setting_crad_model.dart';
import 'package:ecommerce_app/features/settings/presentation/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileRepo {
  static List<Widget> screens = [
    MyProfileView(),
    MyOrdersView(),
    MyFavoritesView(),
    SettingsView(),
  ];
  static final CacheHelper _cacheHelper = CacheHelper();
  static String userName() {
    return _cacheHelper.getData(key: StorageKey.name);
  }

  static String userEmail() {
    return _cacheHelper.getData(key: StorageKey.email);
  }

  static Widget image() {
    String? image = _cacheHelper.getData(key: StorageKey.imagepath);
    if (image == null) {
      return SvgPicture.asset(
        AssetIconManager.myProfile,
        fit: BoxFit.scaleDown,
      );
    } else {
      return Image.network(
        image,
        fit: BoxFit.cover,
      );
    }
  }

  static List<SettingCradModel> settingCardsData() {
    return List.generate(5, (index) {
      return SettingCradModel(
        icon: _getIcon(index),
        title: _getTitle(index),
      );
    });
  }

  static String _getTitle(int index) {
    switch (index) {
      case 0:
        return LanguageGlobaleVar.myProfile.tr;
      case 1:
        return LanguageGlobaleVar.myOrders.tr;
      case 2:
        return LanguageGlobaleVar.myFavorites.tr;
      case 3:
        return LanguageGlobaleVar.settings.tr;
      case 4:
        return LanguageGlobaleVar.logOut.tr;
      default:
        return "";
    }
  }

  static String _getIcon(int index) {
    switch (index) {
      case 0:
        return AssetIconManager.myprofileicon;
      case 1:
        return AssetIconManager.myordersicon;
      case 2:
        return AssetIconManager.myfavoritesicon;
      case 3:
        return AssetIconManager.settings;
      case 4:
        return AssetIconManager.logouticon;
      default:
        return "";
    }
  }
  // [
  //   SettingCradModel(
  //     icon: AssetIconManager.myprofileicon,
  //     title: LanguageGlobaleVar.myProfile.tr,
  //   ),
  //   SettingCradModel(
  //     icon: AssetIconManager.myordersicon,
  //     title: LanguageGlobaleVar.myOrders.tr,
  //   ),
  //   SettingCradModel(
  //     icon: AssetIconManager.myfavoritesicon,
  //     title: LanguageGlobaleVar.myFavorites.tr,
  //   ),
  //   SettingCradModel(
  //       icon: AssetIconManager.settings, title: LanguageGlobaleVar.settings.tr),
  //   SettingCradModel(
  //     icon: AssetIconManager.logouticon,
  //     title: LanguageGlobaleVar.logOut.tr,
  //   ),
  // ];
}
