import 'package:ecommerce_app/features/search/data/repo/search_repo.dart';
import 'package:ecommerce_app/features/search/manager/search_cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInit());
  static SearchCubit get(context) => BlocProvider.of(context);
  SearchRepo repo = SearchRepo();
  void search(String word) async {
    emit(SearchLaoding());

    var res = await repo.search(word);

    res.fold((error) => emit(SearchFailing(errMessage: error)),
        (success) => emit(SearchSuccess(data: success)));
  }

  void onSubmit(String? word) {
    if (word == null || word.isEmpty) {
      return;
    } else {
      search(word);
    }
  }
}
