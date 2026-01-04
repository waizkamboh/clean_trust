import 'dart:ui';

import 'package:get/get.dart';
import '../../../view_model/controller/general_controller.dart';
import '../../app_constant.dart';
import '../translation/cs.dart';
import '../translation/en.dart';
import '../translation/ru.dart';

class LocalizationService extends Translations {

  static final locale = Locale(
    Get.find<GeneralController>().sharedPreferences.getString(language) == null
        ? "en"
        : Get.find<GeneralController>().sharedPreferences.getString(language).toString(),
  );

  static final fallbackLocale = Locale(
    Get.find<GeneralController>().sharedPreferences.getString(language) == null
        ? "en"
        : Get.find<GeneralController>().sharedPreferences.getString(language).toString(),
  );

  static final langs = [
    'english',
    'czech',
    'russian',
  ];

  static final locales = [
    const Locale('en'),
    const Locale('cs'),
    const Locale('ru'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en,
    'cs_CZ': cs,
    'ru_RU': ru,
  };

  changeLocale(String lang) {
    final locale = getlocaleFromLanguages(lang);
    return Get.updateLocale(locale);
  }

  Locale getlocaleFromLanguages(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
