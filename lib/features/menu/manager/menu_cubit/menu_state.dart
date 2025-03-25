abstract class MenuState {}

class MenuGetDataLoading extends MenuState {}

class MenuGetDataSuccess extends MenuState {}

class MenuGetDataFailing extends MenuState {
  final String errMessage;

  MenuGetDataFailing({required this.errMessage});
}

class MenuSelectCategory extends MenuState {}
