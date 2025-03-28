import 'package:ecommerce_app/features/my_favorites/data/repo/my_favorite_repo.dart';
import 'package:ecommerce_app/features/my_favorites/manager/my_favorite_cubit/my_favorite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFavoriteCubit extends Cubit<MyFavoriteState> {
  MyFavoriteCubit() : super(MyFavoriteLaoding()) {
    getData();
  }
  static MyFavoriteCubit get(context) => BlocProvider.of(context);
  MyFavoriteRepo repo = MyFavoriteRepo();

  void getData() async {
    emit(MyFavoriteLaoding());
    var res = await repo.getFavorite();

    res.fold((err) => emit(MyFavoriteFailing(errMessage: err)),
        (success) => emit(MyFavoriteSuccess(favorites: success)));
  }
}
