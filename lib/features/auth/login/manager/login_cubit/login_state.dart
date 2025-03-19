abstract class LoginState {}

class LoginInit extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailing extends LoginState {
  final String errMessage;

  LoginFailing({required this.errMessage});
}

class LoginNotValdiateInput extends LoginState {}
