import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/network/api_end_point.dart';
import 'package:ecommerce_app/core/network/api_helper.dart';
import 'package:ecommerce_app/core/network/dio_failure.dart';
import 'package:ecommerce_app/features/my_favorites/data/model/my_favorite_model.dart';

class MyFavoriteRepo {
  ApiHelper api = ApiHelper();

  Future<Either<String, MyFavoriteModel>> getFavorite() async {
    try {
      var res = await api.get(endPoint: ApiEndPoint.getuserdata, isAuth: true);
      MyFavoriteModel favorites = MyFavoriteModel.fromJson(res);

      return right(favorites);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    }
    // catch (e) {
    //   return left(errorMessage);
    // }
  }
}
