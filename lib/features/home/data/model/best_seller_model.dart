import 'package:ecommerce_app/core/network/api_keys.dart';
import 'package:ecommerce_app/features/home/data/model/product_model.dart';

class BestSellerModel {
  List<ProductModel> bestSellerProducts;
  final bool status;

  BestSellerModel({required this.status, required this.bestSellerProducts});

  factory BestSellerModel.fromJson(Map<String, dynamic> json) {
    List<ProductModel> data = [];

    for (var element in json[ApiKeys.bestsellerproducts]) {
      data.add(ProductModel.fromJson(element));
    }
    return BestSellerModel(
      status: json[ApiKeys.status],
      bestSellerProducts: data,
    );
  }
}
