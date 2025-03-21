abstract class MyProfileState {}

class MyProfileInitial extends MyProfileState {}

class MyProfileTextNotValidate extends MyProfileState {}

class MyProfileLoading extends MyProfileState {}

class MyProfileSuccess extends MyProfileState {
  final String message;

  MyProfileSuccess({required this.message});
}

class MyProfileFailing extends MyProfileState {
  final String errMessage;

  MyProfileFailing({required this.errMessage});
}
