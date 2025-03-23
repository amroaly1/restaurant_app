import 'package:ecommerce_app/core/network/api_keys.dart';
import 'package:ecommerce_app/features/home/data/model/slider_model.dart';

class SliderResponseModel {
  final List<SliderModel> sliders;
  final bool status;

  SliderResponseModel({required this.sliders, required this.status});

  factory SliderResponseModel.fromJson(Map<String, dynamic> json) {
    List<SliderModel> sliderss = [];
    for (var element in json[ApiKeys.sliders]) {
      sliderss.add(SliderModel.fromJson(element));
    }

    return SliderResponseModel(sliders: sliderss, status: json[ApiKeys.status]);
  }
}
