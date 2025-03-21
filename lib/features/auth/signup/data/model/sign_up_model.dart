import 'package:ecommerce_app/core/network/api_keys.dart';

class SignUpModel {
  final String fullName;
  final String email;
  final String mobileNumber;
  final String password;

  SignUpModel({
    required this.fullName,
    required this.email,
    required this.mobileNumber,
    required this.password,
  });

  Map<String, String> toJson() {
    return {
      ApiKeys.name: fullName,
      ApiKeys.email: email,
      ApiKeys.phone: mobileNumber,
      ApiKeys.password: password,
    };
  }
}
