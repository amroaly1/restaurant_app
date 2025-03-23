import 'package:ecommerce_app/core/manager/update_profile_cubit/update_profile_state.dart';
import 'package:ecommerce_app/core/model/user_model.dart';
import 'package:ecommerce_app/core/network/api_end_point.dart';
import 'package:ecommerce_app/core/network/api_helper.dart';
import 'package:ecommerce_app/core/network/api_keys.dart';
import 'package:ecommerce_app/core/network/dio_failure.dart';
import 'package:ecommerce_app/core/storage/cache_helper.dart';
import 'package:ecommerce_app/core/storage/storage_key.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  // UpdateProfileCubit() : super(UpdateProfileInit());

  UpdateProfileCubit._() : super(UpdateProfileInit());
  static final UpdateProfileCubit _instance = UpdateProfileCubit._();
  factory UpdateProfileCubit() {
    return _instance;
  }
  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  Future<void> getData() async {
    // if (isClosed) return;
    ApiHelper apiHelper = ApiHelper();

    try {
      var response =
          await apiHelper.get(endPoint: ApiEndPoint.getuserdata, isAuth: true);

      UserModel userModel = UserModel.fromJson(response[ApiKeys.user]);
      _updateData(userModel);

      emit(UpdateProfileDone());
    } on CustomDioException catch (e) {
      if (e.errMessage == "Token has expired.") {
        getData();
      }
    }
  }

  void _updateData(UserModel user) async {
    CacheHelper cacheHelper = CacheHelper();
    // store name
    await cacheHelper.saveData(key: StorageKey.name, value: user.name);
    // store phone
    await cacheHelper.saveData(key: StorageKey.phone, value: user.phone);
    // store image path
    await cacheHelper.saveData(
        key: StorageKey.imagepath, value: user.imagePath);
  }
}
