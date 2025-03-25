import 'package:ecommerce_app/core/network/api_keys.dart';

class MyFavoriteModel {
  final List<ProductModel> data;

  MyFavoriteModel({required this.data});

  factory MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    List<ProductModel> data = [];

    for (var element in json[ApiKeys.user][ApiKeys.favoriteproducts]) {
      data.add(ProductModel.fromJson(element));
    }

    return MyFavoriteModel(data: data);
  }
}

class ProductModel {
  final int bestSeller;
  final String description;
  final int id;
  final String imagePath;

  final String name;
  final double price;
  final double rating;

  ProductModel(
      {required this.bestSeller,
      required this.description,
      required this.id,
      required this.imagePath,
      required this.name,
      required this.price,
      required this.rating});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      bestSeller: json[ApiKeys.bestseller],
      description: json[ApiKeys.description],
      id: json[ApiKeys.id],
      imagePath: json[ApiKeys.imagepath],
      name: json[ApiKeys.name],
      price: json[ApiKeys.price],
      rating: json[ApiKeys.rating],
    );
  }
}
