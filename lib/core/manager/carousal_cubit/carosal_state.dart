import 'package:ecommerce_app/features/home/data/model/slider_model.dart';

abstract class CarosalState {}

class CarosalInit extends CarosalState {}

class CarosalGetDataLoading extends CarosalState {}

class CarosalGetDataSucess extends CarosalState {
  final List<SliderModel> data;

  CarosalGetDataSucess({required this.data});
}

class CarosalGetDataFailure extends CarosalState {
  final String errMessage;

  CarosalGetDataFailure({required this.errMessage});
}

class CarosalChangeIndex extends CarosalState {}

class CarosalChangePage extends CarosalState {}
