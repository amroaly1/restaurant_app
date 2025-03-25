import 'package:ecommerce_app/core/network/api_keys.dart';
import 'package:ecommerce_app/features/menu/data/model/category_model.dart';

class CategoryReponse {
  final List<CategoryModel> categories;
  final bool status;

  CategoryReponse({required this.categories, required this.status});

  factory CategoryReponse.fromJson(Map<String, dynamic> json) {
    List<CategoryModel> data = [];

    for (var element in json[ApiKeys.categories]) {
      data.add(CategoryModel.fromJson(element));
    }
    return CategoryReponse(
      categories: data,
      status: json[ApiKeys.status],
    );
  }
}
