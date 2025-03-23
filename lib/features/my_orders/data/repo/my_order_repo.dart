import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/constant/constant.dart';
import 'package:ecommerce_app/core/network/api_end_point.dart';
import 'package:ecommerce_app/core/network/api_helper.dart';
import 'package:ecommerce_app/core/network/dio_failure.dart';
import 'package:ecommerce_app/features/my_orders/data/model/my_order_model.dart';
// import 'package:ecommerce_app/features/my_orders/data/model/custom_model.dart';

class MyOrderRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, MyOrderModel>> getMyOrder() async {
    try {
      var response =
          await apiHelper.get(endPoint: ApiEndPoint.orders, isAuth: true);
      // log(response.toString());
      MyOrderModel orders = MyOrderModel.fromJson(response);

      return right(orders);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    } catch (e) {
      return left(errorMessage);
    }
  }

  Future<Either<String, void>> cancelActiveOrder(int id) async {
    try {
      await apiHelper.post(
          endPoint: "${ApiEndPoint.cancelorder}/$id", isAuth: true);
      return right(null);
    } on CustomDioException catch (e) {
      if (e.errMessage == "Token has expired.") {
        cancelActiveOrder(id);
      }
      return left(e.errMessage);
    } catch (e) {
      return left(errorMessage);
    }
  }
}
