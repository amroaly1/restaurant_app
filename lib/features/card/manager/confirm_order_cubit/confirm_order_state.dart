abstract class ConfirmOrderState {}

class ConfirmOrderInit extends ConfirmOrderState {}

class ConfirmOrderLaoding extends ConfirmOrderState {}

class ConfirmOrderFailing extends ConfirmOrderState {
  final String errMessage;

  ConfirmOrderFailing({required this.errMessage});
}

class ConfirmOrderSuccess extends ConfirmOrderState {}
