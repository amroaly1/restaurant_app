import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/constant/constant.dart';
import 'package:ecommerce_app/core/network/api_end_point.dart';
import 'package:ecommerce_app/core/network/api_helper.dart';
import 'package:ecommerce_app/core/network/api_keys.dart';
import 'package:ecommerce_app/core/network/dio_failure.dart';
import 'package:ecommerce_app/features/home/data/model/best_seller_model.dart';
import 'package:ecommerce_app/features/home/data/model/product_model.dart';
import 'package:ecommerce_app/features/home/data/model/slider_model.dart';
import 'package:ecommerce_app/features/home/data/model/slider_response_model.dart';
import 'package:ecommerce_app/features/home/data/model/top_rate_model.dart';

class HomeRepo {
  HomeRepo._();
  static HomeRepo? _instance;

  factory HomeRepo() {
    _instance ??= HomeRepo._();
    return _instance!;
  }

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

  Future<Either<String, List<ProductModel>>> getBestSeller() async {
    try {
      var response = await apiHelper.get(
          endPoint: ApiEndPoint.bestsellerproducts, isAuth: true);
      log(response.toString());

      BestSellerModel res = BestSellerModel.fromJson(response);

      return right(res.bestSellerProducts);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    }
    // catch (e) {
    //   return left(errorMessage);
    // }
  }

  Future<Either<String, List<ProductModel>>> getTopRate() async {
    try {
      var response = await apiHelper.get(
          endPoint: ApiEndPoint.topratedproducts, isAuth: true);
      log(response.toString());

      TopRateModel res = TopRateModel.fromJson(response);

      return right(res.products);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    } catch (e) {
      return left(errorMessage);
    }
  }

  Future<Either<String, void>> addToFavorite(int id) async {
    try {
      await apiHelper.post(
          endPoint: ApiEndPoint.addtofavorite,
          data: {ApiKeys.productid: id},
          isAuth: true);

      return right(null);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    } catch (e) {
      return left(errorMessage);
    }
  }
}
