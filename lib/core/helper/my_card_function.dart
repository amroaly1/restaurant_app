import 'package:ecommerce_app/core/model/my_card_model.dart';

class MyCardFunction {
  MyCardFunction._();
  static MyCardFunction? _instance;

  factory MyCardFunction() {
    _instance ??= MyCardFunction._();

    return _instance!;
  }

  List<MyCardModel> data = [];

  bool addProductToCard(MyCardModel card) {
    for (var element in data) {
      if (element.product.id == card.product.id) {
        return false;
      }
    }
    data.add(card);
    return true;
  }

  void editMyCard(MyCardModel card, int count) {
    for (int i = 0; i < data.length; i++) {
      if (data[i].product.id == card.product.id) {
        data[i].count = count;
        return;
      }
    }
  }

  void removeCard(MyCardModel card) {
    for (int i = 0; i < data.length; i++) {
      if (data[i].product.id == card.product.id) {
        data.removeAt(i);
        return;
      }
    }
  }

  void removeAllElement() {
    data = [];
  }
}
