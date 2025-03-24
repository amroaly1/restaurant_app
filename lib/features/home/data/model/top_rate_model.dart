import 'package:ecommerce_app/core/network/api_keys.dart';
import 'package:ecommerce_app/features/home/data/model/product_model.dart';

class TopRateModel {
  List<ProductModel> products;
  final bool status;

  TopRateModel({required this.status, required this.products});

  factory TopRateModel.fromJson(Map<String, dynamic> json) {
    List<ProductModel> data = [];

    for (var element in json[ApiKeys.products]) {
      data.add(ProductModel.fromJson(element));
    }

    return TopRateModel(
      status: json[ApiKeys.status],
      products: data,
    );
  }
}
