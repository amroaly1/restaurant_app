import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/api_base_url.dart';
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
    )..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          talker.warning("Request : ");
          talker.warning("Headers : ${options.headers.toString()}");
          talker.warning("end point : ${options.path}");
          talker.warning("base url : ${options.baseUrl}");
          talker.warning("method : ${options.method}");
          talker.warning("query parameter : ${options.queryParameters}");
          talker.warning("data : ${options.data}");
          return handler.next(options);
        },
        onResponse: (options, handler) {
          talker.info("Response : ");
          talker.info("Headers : ${options.headers.toString()}");

          talker.info("data : ${options.data}");
          return handler.next(options);
        },
      ));
  }
}
