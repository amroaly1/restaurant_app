import 'package:ecommerce_app/features/home/data/model/product_model.dart';

abstract class SearchState {}

class SearchInit extends SearchState {}

class SearchLaoding extends SearchState {}

class SearchFailing extends SearchState {
  final String errMessage;

  SearchFailing({required this.errMessage});
}

class SearchSuccess extends SearchState {
  final List<ProductModel> data;

  SearchSuccess({required this.data});
}
