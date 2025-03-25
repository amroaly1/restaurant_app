import 'dart:async';
import 'package:ecommerce_app/features/search/data/repo/search_repo.dart';
import 'package:ecommerce_app/features/search/manager/search_cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInit());
  static SearchCubit get(context) => BlocProvider.of(context);
  SearchRepo repo = SearchRepo();
  Timer? _debouncing;
  void search(String? word) async {
    emit(SearchLaoding());
    if (word == null || word.isEmpty) {
      emit(SearchIsEmpty());
      return;
    }
    var res = await repo.search(word);

    res.fold((error) => emit(SearchFailing(errMessage: error)),
        (success) => emit(SearchSuccess(data: success)));
  }

  void onChangeText(String? word) {
    if (_debouncing?.isActive ?? false) {
      _debouncing!.cancel();
    }
    _debouncing = Timer(Duration(seconds: 2), () {
      search(word);
    });
  }
}
