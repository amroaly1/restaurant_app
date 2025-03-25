import 'package:ecommerce_app/features/my_favorites/data/model/my_favorite_model.dart';

abstract class MyFavoriteState {}

class MyFavoriteLaoding extends MyFavoriteState {}

class MyFavoriteFailing extends MyFavoriteState {
  final String errMessage;

  MyFavoriteFailing({required this.errMessage});
}

class MyFavoriteSuccess extends MyFavoriteState {
  final MyFavoriteModel favorites;

  MyFavoriteSuccess({required this.favorites});
}
