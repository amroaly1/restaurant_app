import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/constant/constant.dart';
import 'package:ecommerce_app/core/network/api_end_point.dart';
import 'package:ecommerce_app/core/network/api_helper.dart';
import 'package:ecommerce_app/core/network/api_keys.dart';
import 'package:ecommerce_app/core/network/dio_failure.dart';
import 'package:ecommerce_app/features/auth/signup/data/model/sign_up_model.dart';

class SignUpRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, String>> signUp(
      {required String fullName,
      required String email,
      required String mobile,
      required String password}) async {
    try {
      SignUpModel signUpModel = SignUpModel(
          email: email,
          mobileNumber: mobile,
          fullName: fullName,
          password: password);

      var response = await apiHelper.post(
          endPoint: ApiEndPoint.register, data: signUpModel.toJson());

      String message = response[ApiKeys.message];
      return right(message);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    } catch (e) {
      return left(errorMessage);
    }
  }
}
