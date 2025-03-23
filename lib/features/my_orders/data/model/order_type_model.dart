import 'package:ecommerce_app/features/my_orders/data/model/driver_model.dart';
import 'package:ecommerce_app/features/my_orders/data/model/item_model.dart';

class OrderTypeModel {
  DriverModel? driver;
  List<ItemModel>? items;
  int? id;
  String? orderChangeDate;
  String? orderDate;
  double? shipping;
  int? status;
  double? subtotal;
  double? tax;
  double? total;

  OrderTypeModel(
      {required this.driver,
      required this.items,
      required this.id,
      required this.orderChangeDate,
      required this.orderDate,
      required this.shipping,
      required this.status,
      required this.subtotal,
      required this.tax,
      required this.total});

  OrderTypeModel.fromJson(Map<String, dynamic> json) {
    driver =
        json['driver'] != null ? DriverModel.fromJson(json['driver']) : null;
    id = json['id'];
    if (json['items'] != null) {
      items = <ItemModel>[];
      json['items'].forEach((v) {
        items!.add(ItemModel.fromJson(v));
      });
    }
    orderChangeDate = json['order_change_date'];
    orderDate = json['order_date'];
    shipping = json['shipping'];
    status = json['status'];
    subtotal = json['subtotal'];
    tax = json['tax'];
    total = json['total'];
  }
}
