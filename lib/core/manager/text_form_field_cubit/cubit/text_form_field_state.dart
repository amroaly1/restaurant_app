part of 'text_form_field_cubit.dart';

@immutable
sealed class TextFormFieldState {}

final class TextFormFieldInitial extends TextFormFieldState {}

final class TextFormFieldChangeObscure extends TextFormFieldState {}
