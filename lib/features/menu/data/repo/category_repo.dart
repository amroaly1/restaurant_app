import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/network/api_end_point.dart';
import 'package:ecommerce_app/core/network/api_helper.dart';
import 'package:ecommerce_app/core/network/dio_failure.dart';
import 'package:ecommerce_app/core/utils/asset_icon_manager.dart';
import 'package:ecommerce_app/features/menu/data/model/category_model.dart';
import 'package:ecommerce_app/features/menu/data/model/category_model_copy.dart';
import 'package:ecommerce_app/features/menu/data/model/category_reponse.dart';
import 'package:get/get.dart';

class CategoryRepo {
  CategoryRepo._();
  static CategoryRepo? _instance;
  factory CategoryRepo() {
    _instance ??= CategoryRepo._();

    return _instance!;
  }

  ApiHelper api = ApiHelper();

  Future<Either<String, List<CategoryModel>>> getCategory() async {
    try {
      var resonse =
          await api.get(endPoint: ApiEndPoint.categories, isAuth: true);

      CategoryReponse categoryReponse = CategoryReponse.fromJson(resonse);

      return right(categoryReponse.categories);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    }
    // catch (e) {
    //   return left(errorMessage);
    // }
  }

  static List<CategoryModelCopy> categorys = [
    CategoryModelCopy(
        icon: AssetIconManager.snacks, label: LanguageGlobaleVar.snacks.tr),
    CategoryModelCopy(
        icon: AssetIconManager.meals, label: LanguageGlobaleVar.meal.tr),
    CategoryModelCopy(
        icon: AssetIconManager.vegan, label: LanguageGlobaleVar.vegan.tr),
    CategoryModelCopy(
        icon: AssetIconManager.desserts, label: LanguageGlobaleVar.dessert.tr),
    CategoryModelCopy(
        icon: AssetIconManager.drinks, label: LanguageGlobaleVar.drinks.tr),
  ];
}
