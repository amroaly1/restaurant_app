import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/api_base_url.dart';
import 'package:ecommerce_app/core/network/api_end_point.dart';
import 'package:ecommerce_app/core/network/api_keys.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/storage/cache_helper.dart';
import 'package:ecommerce_app/core/storage/storage_key.dart';
import 'package:ecommerce_app/features/welcome/presentation/widget/welcome_body.dart';
import 'package:talker/talker.dart';

abstract class DioConfiguration {
  static BaseOptions baseOptions() {
    return BaseOptions(
      baseUrl: ApiBaseUrl.baseUrl,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 60),
    );
  }

  static Dio instanceOfDio() {
    final talker = Talker();
    return Dio(
      baseOptions(),
    )..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        talker.warning("Request : ");
        talker.warning("Headers : ${options.headers.toString()}");
        talker.warning("end point : ${options.path}");
        talker.warning("base url : ${options.baseUrl}");
        talker.warning("method : ${options.method}");
        talker.warning("query parameter : ${options.queryParameters}");
        talker.warning("data : ${options.data}");
        return handler.next(options);
      }, onResponse: (options, handler) {
        talker.info("Response : ");
        talker.info("Headers : ${options.headers.toString()}");

        talker.info("data : ${options.data}");
        return handler.next(options);
      }, onError: (error, handler) async {
        CacheHelper cacheHelper = CacheHelper();
        final Dio dio = DioConfiguration.instanceOfDio();
        try {
          if (error.response != null) {
            String messageError = error.response!.data['message'];
            if (messageError.contains('Token has expired.')) {
              // refresh token
              var response = await dio.post(
                ApiEndPoint.refreshtoken,
                options: Options(headers: {
                  'Authorization':
                      'Bearer ${cacheHelper.getDataString(key: StorageKey.refreshtoken)}'
                }),
              );
              dynamic value = response;
              if (response.data[ApiKeys.status]) {
                // must update token

                await cacheHelper.saveData(
                  key: StorageKey.accesstoken,
                  value: value.data[ApiKeys.accesstoken],
                );

                // Retry original request

                final options = error.requestOptions;
                if (options.data is FormData) {
                  final oldFormData = options.data as FormData;

                  // Convert FormData to map so it can be rebuilt
                  final Map<String, dynamic> formMap = {};
                  for (var entry in oldFormData.fields) {
                    formMap[entry.key] = entry.value;
                  }

                  // Add files if any
                  for (var file in oldFormData.files) {
                    formMap[file.key] = file.value;
                  }

                  // Rebuild new FormData
                  options.data = FormData.fromMap(formMap);
                }
                options.headers['Authorization'] =
                    'Bearer ${cacheHelper.getDataString(key: StorageKey.accesstoken)}';
                final response = await dio.fetch(options);
                return handler.resolve(response);
              } else {
                // must logout
                // CacheHelper.removeData(key: CacheKeys.accessToken);
                // CacheHelper.removeData(key: CacheKeys.refreshToken);
                // MyNavigator.navigateAndFinish(screen: LoginView());
                RouteManager.navigateToAndRemoveAllScreenFromStack(
                    WelcomeBody());
                return handler.next(error);
              }
            } else {
              return handler.next(error);
            }
          }
        } catch (e) {
          return handler.next(error);
        }

        return handler.next(error);
      }));
  }
}
