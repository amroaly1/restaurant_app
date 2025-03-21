import 'package:ecommerce_app/core/network/api_keys.dart';

class UserModel {
  final String email;
  final List<dynamic> favoriteProducts;
  final int id;
  final String? imagePath;
  final String name;
  final String phone;

  UserModel(
      {required this.email,
      required this.favoriteProducts,
      required this.id,
      this.imagePath,
      required this.name,
      required this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json[ApiKeys.email],
        favoriteProducts: json[ApiKeys.favoriteproducts],
        id: json[ApiKeys.id],
        name: json[ApiKeys.name],
        phone: json[ApiKeys.phone],
        imagePath: json[ApiKeys.imagepath]);
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.email: email,
      ApiKeys.favoriteproducts: favoriteProducts,
      ApiKeys.id: id,
      ApiKeys.name: name,
      ApiKeys.phone: phone,
      ApiKeys.imagepath: imagePath,
    };
  }
}
