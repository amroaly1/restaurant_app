import 'package:ecommerce_app/core/network/api_end_point.dart';
import 'package:ecommerce_app/core/network/api_helper.dart';
import 'package:ecommerce_app/core/network/api_keys.dart';
import 'package:ecommerce_app/core/network/dio_failure.dart';
import 'package:ecommerce_app/core/storage/cache_helper.dart';
import 'package:ecommerce_app/core/storage/storage_key.dart';

void handleExpairedAcessToken() async {
  ApiHelper apiHelper = ApiHelper();
  CacheHelper cacheHelper = CacheHelper();
  try {
    var respose = await apiHelper.post(
        endPoint: ApiEndPoint.refreshtoken, data: null, isRefrsh: true);
    cacheHelper.saveData(
        key: StorageKey.accesstoken, value: respose[ApiKeys.accesstoken]);
  } on CustomDioException catch (e) {
    return;
  } catch (e) {
    return;
  }
}
