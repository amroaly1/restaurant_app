import 'package:ecommerce_app/features/home/data/repo/home_repo.dart';
import 'package:ecommerce_app/features/home/manager/best_seller_cubit/best_seller_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit() : super(BestSellerLoading()) {
    getData();
  }
  static BestSellerCubit get(context) => BlocProvider.of(context);
  HomeRepo repo = HomeRepo();
  void getData() async {
    var res = await repo.getBestSeller();

    res.fold(
      (error) => emit(
        BestSellerFailing(
          errMessage: error,
        ),
      ),
      (success) => emit(
        BestSellerSuccess(
          data: success,
        ),
      ),
    );
  }
}
