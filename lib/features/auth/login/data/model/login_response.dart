import 'package:ecommerce_app/core/network/api_keys.dart';
import 'package:ecommerce_app/core/model/user_model.dart';

class LoginResponse {
  final String accessToken;
  final String refreshToken;
  final bool status;
  final UserModel user;

  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.status,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json[ApiKeys.accesstoken],
      refreshToken: json[ApiKeys.refreshtoken],
      status: json[ApiKeys.status],
      user: UserModel.fromJson(json[ApiKeys.user]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.accesstoken: accessToken,
      ApiKeys.refreshtoken: refreshToken,
      ApiKeys.status: status,
      ApiKeys.user: user.toJson(),
    };
  }
}
