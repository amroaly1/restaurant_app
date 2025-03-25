import 'package:ecommerce_app/core/helper/my_card_function.dart';
import 'package:ecommerce_app/core/model/my_card_model.dart';
import 'package:ecommerce_app/features/card/manager/card_cubit/card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardInit());

  static CardCubit get(context) => BlocProvider.of(context);
  MyCardFunction mycard = MyCardFunction();
  List<MyCardModel> getData() {
    return mycard.data;
  }

  void increase(MyCardModel card) {
    mycard.editMyCard(card, ++card.count);
    emit(CardIncreaseCount());
  }

  void decrease(MyCardModel card) {
    if (card.count > 1) {
      mycard.editMyCard(card, --card.count);
      emit(CardIncreaseCount());
    }
  }

  void delete(MyCardModel card) {
    mycard.removeCard(card);
    emit(CardDelete());
  }

  double price() {
    double res = 0;
    for (var element in mycard.data) {
      res += (element.product.price * element.count);
    }
    return res;
  }
}
