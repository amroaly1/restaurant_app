import 'package:ecommerce_app/features/menu/manager/menu_cubit/menu_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());
  static MenuCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  void selectCategory(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      emit(MenuSelectCategory());
    }
  }

  bool isSelect(int index) {
    return currentIndex == index;
  }
}
