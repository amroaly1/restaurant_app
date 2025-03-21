import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/api_keys.dart';
import 'package:ecommerce_app/core/network/dio_configuration.dart';
import 'package:ecommerce_app/core/network/dio_failure.dart';
import 'package:ecommerce_app/core/storage/cache_helper.dart';
import 'package:ecommerce_app/core/storage/storage_key.dart';

class ApiHelper {
  ApiHelper._();
  static ApiHelper? _instance;
  factory ApiHelper() {
    _instance ??= ApiHelper._();
    return _instance!;
  }

  final Dio _dio = DioConfiguration.instanceOfDio();

  Future<dynamic> get({
    required String endPoint,
    bool isAuth = false,
    bool isRefrsh = false,
    bool isForm = true,
    Map<String, dynamic>? data,
  }) async {
    try {
      var response = await _dio.get(endPoint,
          data: handelData(isForm: isForm, data: data),
          options:
              Options(headers: _getOption(isAuth, isReferechToken: isRefrsh)));
      return response.data;
    } on DioException catch (e) {
      throw CustomDioException(
        errMessage: ServerFailure.fromDioError(e).errorMessage,
      );
    }
  }

  Future<dynamic> post({
    required String endPoint,
    bool isAuth = false,
    bool isRefrsh = false,
    bool isForm = true,
    Map<String, dynamic>? data,
  }) async {
    try {
      var response = await _dio.post(endPoint,
          data: handelData(isForm: isForm, data: data),
          options:
              Options(headers: _getOption(isAuth, isReferechToken: isRefrsh)));
      return response.data;
    } on DioException catch (e) {
      throw CustomDioException(
        errMessage: ServerFailure.fromDioError(e).errorMessage,
      );
    }
  }

  Future<dynamic> put({
    required String endPoint,
    bool isAuth = false,
    bool isRefrsh = false,
    bool isForm = true,
    Map<String, dynamic>? data,
  }) async {
    try {
      var response = await _dio.put(endPoint,
          data: handelData(isForm: isForm, data: data),
          options:
              Options(headers: _getOption(isAuth, isReferechToken: isRefrsh)));
      return response.data;
    } on DioException catch (e) {
      throw CustomDioException(
        errMessage: ServerFailure.fromDioError(e).errorMessage,
      );
    }
  }

  Object? handelData(
      {required bool isForm, required Map<String, dynamic>? data}) {
    if (data == null) {
      return null;
    }
    if (isForm) {
      return FormData.fromMap(data);
    } else {
      return data;
    }
  }

  Map<String, dynamic>? _getOption(bool isAuth,
      {bool isReferechToken = false}) {
    CacheHelper cacheHelpe = CacheHelper();
    if (isAuth) {
      return {
        ApiKeys.authorization: cacheHelpe.getDataString(
                    key: StorageKey.accesstoken) !=
                null
            ? "Bearer ${cacheHelpe.getDataString(key: StorageKey.accesstoken)}"
            : null,
      };
    }
    if (isReferechToken) {
      return {
        ApiKeys.authorization: cacheHelpe.getDataString(
                    key: StorageKey.refreshtoken) !=
                null
            ? "Bearer ${cacheHelpe.getDataString(key: StorageKey.refreshtoken)}"
            : null,
      };
    } else {
      return null;
    }
  }
}
