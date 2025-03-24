abstract class MenuItemState {}

class MenuItemInit extends MenuItemState {}

class MenuItemIncreaseItem extends MenuItemState {}

class MenuItemDecrease extends MenuItemState {}

class MenuItemAddtoFavOrRemove extends MenuItemState {}

class MenuItemAddtoFavFailing extends MenuItemState {
  final String errMessage;

  MenuItemAddtoFavFailing({required this.errMessage});
}
