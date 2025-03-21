import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/constant/constant.dart';
import 'package:ecommerce_app/core/network/api_end_point.dart';
import 'package:ecommerce_app/core/network/api_helper.dart';
import 'package:ecommerce_app/core/network/api_keys.dart';
import 'package:ecommerce_app/core/network/dio_failure.dart';
import 'package:ecommerce_app/core/storage/cache_helper.dart';
import 'package:ecommerce_app/core/storage/storage_key.dart';
import 'package:ecommerce_app/features/auth/login/data/model/login_response.dart';

class LoginRepo {
  ApiHelper apiHelper = ApiHelper();
  ApiHelper api = ApiHelper();

  Future<Either<String, void>> login(
      {required String email, required String password}) async {
    try {
      var data = {
        ApiKeys.email: email,
        ApiKeys.password: password,
      };
      var replay = await api.post(endPoint: ApiEndPoint.login, data: data);

      var response = LoginResponse.fromJson(replay);
      log(response.toJson().toString());
      storeDataInSharedPreference(response);

      return right(null);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    } catch (e) {
      log(e.toString());
      return left(errorMessage);
    }
  }

  void storeDataInSharedPreference(LoginResponse resp) async {
    CacheHelper cacheHelper = CacheHelper();
    // store accessKey
    await cacheHelper.saveData(
        key: StorageKey.accesstoken, value: resp.accessToken);
    // store RefreshKey
    await cacheHelper.saveData(
        key: StorageKey.refreshtoken, value: resp.refreshToken);
    // store email
    await cacheHelper.saveData(key: StorageKey.email, value: resp.user.email);
    // store name
    await cacheHelper.saveData(key: StorageKey.name, value: resp.user.name);
    // store phone
    await cacheHelper.saveData(key: StorageKey.phone, value: resp.user.phone);
    // store image path
    await cacheHelper.saveData(
        key: StorageKey.imagepath, value: resp.user.imagePath);
  }
}
