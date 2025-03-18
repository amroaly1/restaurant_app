import 'package:ecommerce_app/core/localization/a_r_language.dart';
import 'package:ecommerce_app/core/localization/e_n_language.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar_EG': ARLanguage.arLanguage,
        'en_US': ENLanguage.enLanguage,
      };
}
