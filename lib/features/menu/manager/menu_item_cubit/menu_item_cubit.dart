import 'package:ecommerce_app/features/home/data/model/product_model.dart';
import 'package:ecommerce_app/features/home/data/repo/home_repo.dart';
import 'package:ecommerce_app/features/menu/manager/menu_item_cubit/menu_item_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuItemCubit extends Cubit<MenuItemState> {
  MenuItemCubit() : super(MenuItemInit());
  static MenuItemCubit get(context) => BlocProvider.of(context);
  int count = 1;
  HomeRepo repo = HomeRepo();
  void increaseItem() {
    count++;
    emit(MenuItemIncreaseItem());
  }

  void decreaseItem() {
    if (count > 1) {
      count--;
      emit(MenuItemDecrease());
    }
  }

  bool canDecrease() {
    return count > 0;
  }

  void addToFavOrRemove(ProductModel product) async {
    if (!product.isFavorite) {
      var response = await repo.addToFavorite(product.id);
      response.fold(
          (error) => emit(MenuItemAddtoFavFailing(errMessage: error)), (r) {});
    }
    product.isFavorite = !product.isFavorite;
    emit(MenuItemAddtoFavOrRemove());
  }

  IconData iconOfFavorite(ProductModel product) {
    return product.isFavorite ? Icons.favorite : Icons.favorite_border;
  }

  void addToCard() {
    // toDo add to card
  }
}
