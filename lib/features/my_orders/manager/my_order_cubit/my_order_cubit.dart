import 'package:ecommerce_app/features/my_orders/manager/my_order_cubit/my_order_state.dart';
import 'package:ecommerce_app/features/my_orders/presentation/widget/list_of_active_order.dart';
import 'package:ecommerce_app/features/my_orders/presentation/widget/list_of_cancel_order.dart';
import 'package:ecommerce_app/features/my_orders/presentation/widget/list_of_complete_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderCubit extends Cubit<MyOrderState> {
  MyOrderCubit() : super(MyOrderStateInitial());

  static MyOrderCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<String> myOrderType = [
    "Active",
    "Completed",
    "Cancelled",
  ];

  List<Widget> selectList = [
    ListOfActiveOrder(),
    ListOfCompleteTask(),
    ListOfCancelOrder(),
  ];

  void changeCurrentIndex(int index) {
    currentIndex = index;

    emit(MyOrderChangeCategory());
  }

  Widget currentList() {
    return selectList[currentIndex];
  }
}
