import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/features/my_orders/data/model/my_order_model.dart';
import 'package:ecommerce_app/features/my_orders/data/model/order_type_model.dart';
import 'package:ecommerce_app/features/my_orders/data/repo/my_order_repo.dart';
import 'package:ecommerce_app/features/my_orders/manager/my_order_cubit/my_order_state.dart';
import 'package:ecommerce_app/features/my_orders/presentation/widget/list_of_active_order.dart';
import 'package:ecommerce_app/features/my_orders/presentation/widget/list_of_cancel_order.dart';
import 'package:ecommerce_app/features/my_orders/presentation/widget/list_of_complete_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class MyOrderCubit extends Cubit<MyOrderState> {
  // MyOrderCubit() : super(MyOrderStateInitial()) {
  //   getOrder();
  // }

  MyOrderCubit._() : super(MyOrderStateInitial()) {
    getOrder();
  }

  static MyOrderCubit? _instance;
  factory MyOrderCubit() {
    _instance ??= MyOrderCubit._();
    return _instance!;
  }

  static MyOrderCubit get(context) => BlocProvider.of(context);

  MyOrderRepo repo = MyOrderRepo();
  MyOrderModel? orderModel;

  List<OrderTypeModel> orderType = [];

  void getOrder() async {
    emit(MyOrderGetDataLaoding());
    var response = await repo.getMyOrder();
    response.fold((e) => emit(MyOrderGetDataFailing(errMessage: e)), (sucess) {
      orderModel = sucess;
      changeList();
      emit(MyOrderGetDataSuccess());
    });
  }

  void changeList() {
    switch (currentIndex) {
      case 0:
        orderType = orderModel!.orders.active;
        break;
      case 1:
        orderType = orderModel!.orders.completed;
        break;
      case 2:
        orderType = orderModel!.orders.canceled;
        break;
    }
  }

  int currentIndex = 0;

  List<String> getMyOrderTypeTitil() {
    return [
      LanguageGlobaleVar.active.tr,
      LanguageGlobaleVar.completed.tr,
      LanguageGlobaleVar.cancelled.tr,
    ];
  }

  void changeCurrentIndex(int index) {
    if (orderModel != null) {
      currentIndex = index;
      changeList();
      emit(MyOrderChangeCategory());
    }
  }

  Widget currentList() {
    switch (currentIndex) {
      case 0:
        return ListOfActiveOrder(
          orderType: orderType,
        );
      case 1:
        return ListOfCompleteTask(
          orderType: orderType,
        );
      case 2:
        return ListOfCancelOrder(
          orderType: orderType,
        );
      default:
        return SizedBox();
    }
  }

  void cancelOrder(int id) async {
    emit(MyOrderCancelOrderLoading());
    var response = await repo.cancelActiveOrder(id);

    response.fold((e) => emit(MyOrderCancelOrderFailing(errMessage: e)),
        (succes) {
      emit(MyOrderCancelOrderSuccess());
      getOrder();
    });
  }
}
