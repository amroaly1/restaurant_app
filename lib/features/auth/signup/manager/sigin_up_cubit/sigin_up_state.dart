abstract class SiginUpState {}

class SiginUpInit extends SiginUpState {}

class SiginUpLoading extends SiginUpState {}

class SiginUpSuccess extends SiginUpState {}

class SiginUpFailing extends SiginUpState {
  final String errMessage;

  SiginUpFailing({required this.errMessage});
}

class SiginUpNotValidateInput extends SiginUpState {}
