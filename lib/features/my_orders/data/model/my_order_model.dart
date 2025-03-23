import 'dart:developer';

import 'package:ecommerce_app/core/network/api_keys.dart';
import 'package:ecommerce_app/features/my_orders/data/model/order_model.dart';

class MyOrderModel {
  final OrderModel orders;
  final bool status;

  MyOrderModel({required this.orders, required this.status});

  factory MyOrderModel.fromJson(Map<String, dynamic> json) {
    log(json[ApiKeys.orders].toString());
    return MyOrderModel(
      orders: OrderModel.fromJson(json[ApiKeys.orders]),
      status: json[ApiKeys.status],
    );
  }
}
