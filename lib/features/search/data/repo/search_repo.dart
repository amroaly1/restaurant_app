import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/constant/constant.dart';
import 'package:ecommerce_app/core/network/api_end_point.dart';
import 'package:ecommerce_app/core/network/api_helper.dart';
import 'package:ecommerce_app/core/network/dio_failure.dart';
import 'package:ecommerce_app/features/home/data/model/product_model.dart';
import 'package:ecommerce_app/features/search/data/model/search_model.dart';

class SearchRepo {
  ApiHelper api = ApiHelper();

  Future<Either<String, List<ProductModel>>> search(String word) async {
    try {
      var response = await api.get(
          endPoint: ApiEndPoint.search,
          isAuth: true,
          queryParameters: {"q": word});

      SearchModel res = SearchModel.fromJson(response);

      return right(res.products);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    } catch (e) {
      return left(errorMessage);
    }
  }
}
