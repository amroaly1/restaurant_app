import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constant/constant.dart';
import 'package:ecommerce_app/core/manager/update_profile_cubit/update_profile_cubit.dart';
import 'package:ecommerce_app/core/network/api_end_point.dart';
import 'package:ecommerce_app/core/network/api_helper.dart';
import 'package:ecommerce_app/core/network/api_keys.dart';
import 'package:ecommerce_app/core/network/dio_failure.dart';

class MyProfileRepo {
  Future<Either<String, String>> updateData(
      {required String name, required String mobile, File? image}) async {
    ApiHelper apiHelper = ApiHelper();
    try {
      var data = await getData(name: name, image: image, phone: mobile);
      var response = await apiHelper.put(
          endPoint: ApiEndPoint.updateprofile, data: data, isAuth: true);
      UpdateProfileCubit updateProfileCubit = UpdateProfileCubit();
      await updateProfileCubit.getData();
      return right(response[ApiKeys.message]);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    } catch (e) {
      return left(errorMessage);
    }
  }

  Future<Map<String, dynamic>> getData(
      {required String name, required String phone, File? image}) async {
    var path = image != null
        ? await MultipartFile.fromFile(image.path,
            filename: image.path.split('/').last)
        : null;
    if (path != null) {
      return {
        ApiKeys.name: name,
        ApiKeys.phone: phone,
        ApiKeys.image: path,
      };
    } else {
      return {
        ApiKeys.name: name,
        ApiKeys.phone: phone,
      };
    }
  }
}
