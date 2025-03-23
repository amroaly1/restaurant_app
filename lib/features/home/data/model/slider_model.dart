import 'package:ecommerce_app/core/network/api_keys.dart';

class SliderModel {
  final String description;
  final int id;
  final String imagePath;
  final String title;

  SliderModel(
      {required this.description,
      required this.id,
      required this.imagePath,
      required this.title});

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      description: json[ApiKeys.description],
      id: json[ApiKeys.id],
      imagePath: json[ApiKeys.imagepath],
      title: json[ApiKeys.title],
    );
  }
}
