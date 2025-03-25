import 'package:ecommerce_app/features/home/data/model/product_model.dart';
import 'package:ecommerce_app/features/menu/data/model/category_model.dart';
import 'package:ecommerce_app/features/menu/data/repo/category_repo.dart';
import 'package:ecommerce_app/features/menu/manager/menu_cubit/menu_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuGetDataLoading()) {
    getData();
  }
  static MenuCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  CategoryRepo repo = CategoryRepo();

  List<CategoryModel> data = [];
  void getData() async {
    var response = await repo.getCategory();

    response.fold((error) => emit(MenuGetDataFailing(errMessage: error)),
        (data) {
      this.data = data;
      if (!isClosed) {
        emit(MenuGetDataSuccess());
      }
    });
  }

  void selectCategory(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      emit(MenuSelectCategory());
    }
  }

  bool isSelect(int index) {
    return currentIndex == index;
  }

  List<ProductModel> curentList() {
    return data[currentIndex].products;
  }
}
