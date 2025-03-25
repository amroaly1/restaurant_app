import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/constant/constant.dart';
import 'package:ecommerce_app/core/model/my_card_model.dart';
import 'package:ecommerce_app/core/network/api_end_point.dart';
import 'package:ecommerce_app/core/network/api_helper.dart';
import 'package:ecommerce_app/core/network/api_keys.dart';
import 'package:ecommerce_app/core/network/dio_failure.dart';

class ConfirmOrderRepo {
  ApiHelper api = ApiHelper();

  Future<Either<String, void>> addToPlaceOrder(List<MyCardModel> list) async {
    try {
      Map<String, dynamic> data = {
        ApiKeys.items: returnMapData(list),
      };

      await api.post(
          endPoint: ApiEndPoint.placeorder,
          data: data,
          isAuth: true,
          isForm: false);
      return right(null);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    } catch (e) {
      return left(errorMessage);
    }
  }

  List<Map<String, dynamic>> returnMapData(List<MyCardModel> list) {
    List<Map<String, dynamic>> data = [];
    for (var element in list) {
      data.add({
        ApiKeys.productid: element.product.id,
        ApiKeys.quantity: element.count,
      });
    }
    return data;
  }
}
