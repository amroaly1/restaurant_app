import 'package:ecommerce_app/features/home/data/model/product_model.dart';

abstract class BestSellerState {}

class BestSellerLoading extends BestSellerState {}

class BestSellerSuccess extends BestSellerState {
  final List<ProductModel> data;

  BestSellerSuccess({required this.data});
}

class BestSellerFailing extends BestSellerState {
  final String errMessage;

  BestSellerFailing({required this.errMessage});
}
