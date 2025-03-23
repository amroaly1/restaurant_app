import 'package:ecommerce_app/core/network/api_keys.dart';
import 'package:ecommerce_app/features/my_orders/data/model/order_type_model.dart';

class OrderModel {
  List<OrderTypeModel> active;
  List<OrderTypeModel> canceled;
  List<OrderTypeModel> completed;

  OrderModel(
      {required this.active, required this.canceled, required this.completed});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    // log(json.toString());
    // log(json[ApiKeys.active].toString());

    List<OrderTypeModel> actives = [];

    for (var element in json[ApiKeys.active]) {
      actives.add(OrderTypeModel.fromJson(element));
    }
    List<OrderTypeModel> canceled = [];

    for (var element in json[ApiKeys.canceled]) {
      canceled.add(OrderTypeModel.fromJson(element));
    }
    List<OrderTypeModel> complete = [];

    for (var element in json[ApiKeys.completed]) {
      complete.add(OrderTypeModel.fromJson(element));
    }

    return OrderModel(
      active: actives,
      canceled: canceled,
      completed: complete,
    );
  }
  // OrderModel.fromJson(Map<String, dynamic> json) {
  //   if (json['active'] != null) {
  //     active = <OrderTypeModel>[];
  //     json['active'].forEach((v) {
  //       active!.add(OrderTypeModel.fromJson(v));
  //     });
  //   }
  //   if (json['canceled'] != null) {
  //     canceled = <OrderTypeModel>[];
  //     json['canceled'].forEach((v) {
  //       canceled!.add(OrderTypeModel.fromJson(v));
  //     });
  //   }
  //   if (json['completed'] != null) {
  //     completed = <OrderTypeModel>[];
  //     json['completed'].forEach((v) {
  //       completed!.add(OrderTypeModel.fromJson(v));
  //     });
  //   }
  // }
}
