import 'package:ecommerce_app/core/network/api_keys.dart';
import 'package:ecommerce_app/features/home/data/model/product_model.dart';

class CategoryModel {
  final String description;
  final int id;
  final String imagePath;
  final List<ProductModel> products;
  final String title;

  CategoryModel(
      {required this.description,
      required this.id,
      required this.imagePath,
      required this.products,
      required this.title});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    List<ProductModel> data = [];

    for (var element in json[ApiKeys.products]) {
      data.add(
        ProductModel.fromJson(
          element,
        ),
      );
    }
    return CategoryModel(
      description: json[ApiKeys.description],
      id: json[ApiKeys.id],
      imagePath: json[ApiKeys.imagepath],
      products: data,
      title: json[ApiKeys.title],
    );
  }
}
