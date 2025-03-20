import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/utils/asset_icon_manager.dart';
import 'package:ecommerce_app/features/menu/data/model/category_model.dart';
import 'package:get/get.dart';

class CategoryRepo {
  static List<CategoryModel> categorys = [
    CategoryModel(
        icon: AssetIconManager.snacks, label: LanguageGlobaleVar.snacks.tr),
    CategoryModel(
        icon: AssetIconManager.meals, label: LanguageGlobaleVar.meal.tr),
    CategoryModel(
        icon: AssetIconManager.vegan, label: LanguageGlobaleVar.vegan.tr),
    CategoryModel(
        icon: AssetIconManager.desserts, label: LanguageGlobaleVar.dessert.tr),
    CategoryModel(
        icon: AssetIconManager.drinks, label: LanguageGlobaleVar.drinks.tr),
  ];
}
