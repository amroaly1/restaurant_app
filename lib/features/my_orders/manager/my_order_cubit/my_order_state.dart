abstract class MyOrderState {}

class MyOrderStateInitial extends MyOrderState {}

class MyOrderChangeCategory extends MyOrderState {}

class MyOrderGetDataFailing extends MyOrderState {
  final String errMessage;

  MyOrderGetDataFailing({required this.errMessage});
}

class MyOrderGetDataSuccess extends MyOrderState {}

class MyOrderGetDataLaoding extends MyOrderState {}

class MyOrderCancelOrderLoading extends MyOrderState {}

class MyOrderCancelOrderSuccess extends MyOrderState {}

class MyOrderCancelOrderFailing extends MyOrderState {
  final String errMessage;

  MyOrderCancelOrderFailing({required this.errMessage});
}
