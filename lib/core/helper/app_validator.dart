import 'package:ecommerce_app/core/helper/app_regex.dart';
import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:get/get.dart';

abstract class AppValidator {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LanguageGlobaleVar.pleaseenteryouremail.tr;
    } else if (!AppRegex.isEmailValid(value)) {
      return LanguageGlobaleVar.pleaseentervalidateemail.tr;
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LanguageGlobaleVar.pleaseenteryourpassword.tr;
    } else if (!AppRegex.isPasswordValid(value)) {
      return LanguageGlobaleVar.pleaseentervalidatepassword.tr;
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidator(String? value, String? match) {
    if (value == null || value.isEmpty) {
      return LanguageGlobaleVar.pleaseenteryourpassword.tr;
    } else if (!AppRegex.isPasswordValid(value)) {
      return LanguageGlobaleVar.pleaseentervalidatepassword.tr;
    } else if (value != match) {
      return LanguageGlobaleVar.pleaseentervalidateconfirmpassword.tr;
    } else {
      return null;
    }
  }

  static String? mobileNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LanguageGlobaleVar.pleaseenteryourMobile.tr;
    } else if (!AppRegex.isPhoneNumberValid(value)) {
      return LanguageGlobaleVar.pleaseentervalidateMobile.tr;
    } else {
      return null;
    }
  }

  static String? fullNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LanguageGlobaleVar.pleaseenteryourFullName.tr;
    } else if (value.length <= 5) {
      return LanguageGlobaleVar.pleaseentervalidateFullName.tr;
    } else {
      return null;
    }
  }
}
