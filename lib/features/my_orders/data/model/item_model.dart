import 'package:ecommerce_app/core/network/api_keys.dart';

class ItemModel {
  final String description;
  final int id;
  final String imagePath;
  final String name;
  final double price;
  final int quantity;
  final double rating;
  final double totalPrice;

  ItemModel({
    required this.description,
    required this.id,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.quantity,
    required this.rating,
    required this.totalPrice,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      description: json[ApiKeys.description],
      id: json[ApiKeys.id],
      imagePath: json[ApiKeys.imagepath],
      name: json[ApiKeys.name],
      price: json[ApiKeys.price],
      quantity: json[ApiKeys.quantity],
      rating: json[ApiKeys.rating],
      totalPrice: json[ApiKeys.totalprice],
    );
  }
}
