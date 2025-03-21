abstract class SiginUpState {}

class SiginUpInit extends SiginUpState {}

class SiginUpLoading extends SiginUpState {}

class SiginUpSuccess extends SiginUpState {
  final String message;

  SiginUpSuccess({required this.message});
}

class SiginUpFailing extends SiginUpState {
  final String errMessage;

  SiginUpFailing({required this.errMessage});
}

class SiginUpNotValidateInput extends SiginUpState {}
