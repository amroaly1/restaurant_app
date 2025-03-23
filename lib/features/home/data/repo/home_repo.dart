import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/constant/constant.dart';
import 'package:ecommerce_app/core/network/api_end_point.dart';
import 'package:ecommerce_app/core/network/api_helper.dart';
import 'package:ecommerce_app/core/network/dio_failure.dart';
import 'package:ecommerce_app/features/home/data/model/slider_model.dart';
import 'package:ecommerce_app/features/home/data/model/slider_response_model.dart';

class HomeRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, List<SliderModel>>> getSliders() async {
    try {
      var response = await apiHelper.get(endPoint: ApiEndPoint.sliders);
      log(response.toString());

      SliderResponseModel res = SliderResponseModel.fromJson(response);

      return right(res.sliders);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    } catch (e) {
      return left(errorMessage);
    }
  }
}
