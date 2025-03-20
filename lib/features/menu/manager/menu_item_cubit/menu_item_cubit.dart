import 'package:ecommerce_app/features/menu/manager/menu_item_cubit/menu_item_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuItemCubit extends Cubit<MenuItemState> {
  MenuItemCubit() : super(MenuItemInit());
  static MenuItemCubit get(context) => BlocProvider.of(context);
  int count = 0;
  bool isFav = true;

  void increaseItem() {
    count++;
    emit(MenuItemIncreaseItem());
  }

  void decreaseItem() {
    if (count > 0) {
      count--;
      emit(MenuItemDecrease());
    }
  }

  bool canDecrease() {
    return count > 0;
  }

  void addToFavOrRemove() {
    isFav = !isFav;
    emit(MenuItemAddtoFavOrRemove());
  }

  IconData iconOfFavorite() {
    return isFav ? Icons.favorite : Icons.favorite_border;
  }

  void addToCard() {
    // toDo add to card
  }
}
