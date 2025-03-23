import 'package:ecommerce_app/core/network/api_keys.dart';

class DriverModel {
  final double latitude;
  final double longitude;
  final String name;
  final String phone;

  DriverModel(
      {required this.latitude,
      required this.longitude,
      required this.name,
      required this.phone});

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      latitude: json[ApiKeys.latitude],
      longitude: json[ApiKeys.longitude],
      name: json[ApiKeys.name],
      phone: json[ApiKeys.phone],
    );
  }
}
