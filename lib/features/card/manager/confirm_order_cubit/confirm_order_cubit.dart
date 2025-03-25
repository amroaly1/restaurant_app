import 'package:ecommerce_app/core/helper/my_card_function.dart';
import 'package:ecommerce_app/features/card/data/repo/confirm_order_repo.dart';
import 'package:ecommerce_app/features/card/manager/confirm_order_cubit/confirm_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmOrderCubit extends Cubit<ConfirmOrderState> {
  ConfirmOrderCubit() : super(ConfirmOrderInit());

  static ConfirmOrderCubit get(context) => BlocProvider.of(context);
  ConfirmOrderRepo repo = ConfirmOrderRepo();
  MyCardFunction myCard = MyCardFunction();
  void placeOrdr() async {
    emit(ConfirmOrderLaoding());
    var response = await repo.addToPlaceOrder(myCard.data);

    response.fold((error) => emit(ConfirmOrderFailing(errMessage: error)),
        (success) {
      myCard.removeAllElement();
      emit(ConfirmOrderSuccess());
    });
  }
}
