import 'package:ecommerce_app/core/network/api_keys.dart';

class ProductModel {
  final int bestSeller;
  final String description;
  final int id;
  final String imagePath;
  bool isFavorite;
  final String name;
  final double price;
  final double rating;

  ProductModel(
      {required this.isFavorite,
      required this.bestSeller,
      required this.description,
      required this.id,
      required this.imagePath,
      required this.name,
      required this.price,
      required this.rating});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      isFavorite: json[ApiKeys.isfavorite],
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
