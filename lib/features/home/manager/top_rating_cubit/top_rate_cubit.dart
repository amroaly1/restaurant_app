import 'package:ecommerce_app/features/home/data/model/product_model.dart';
import 'package:ecommerce_app/features/home/data/repo/home_repo.dart';
import 'package:ecommerce_app/features/home/manager/top_rating_cubit/top_rate_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRateCubit extends Cubit<TopRateState> {
  TopRateCubit() : super(TopRateLoading()) {
    getDate();
  }
  static TopRateCubit get(context) => BlocProvider.of(context);
  HomeRepo repo = HomeRepo();
  List<ProductModel> data = [];
  void getDate() async {
    var res = await repo.getTopRate();

    res.fold(
      (errmessage) => emit(TopRateFailing(errMessage: errmessage)),
      (success) {
        data = success;
        emit(TopRateSuccess());
      },
    );
  }

  void addToFavorite(ProductModel product) async {
    if (!product.isFavorite) {
      var response = await repo.addToFavorite(product.id);
      response.fold((error) {
        emit(TopRateaddToFavoiriteFailing(errMessage: error));
        return;
      }, (r) {});
    }
    product.isFavorite = !product.isFavorite;
    emit(TopRateAddtoFavoirite());
  }
}
