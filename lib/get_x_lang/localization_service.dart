import 'dart:ui';

import 'package:get/get.dart';

import 'en_EN.dart';
import 'ru_RU.dart';

class LocalizationService extends Translations {

  static const fallbackLocale = Locale('en', 'EN');

  static final langs = [
    'English',
    'Русский',
  ];

  static final locales = [
    const Locale('en', 'EN'),
    const Locale('ru', 'RU'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
    'en_EN': en_EN,
    'ru_RU': ru_RU,
  };

  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
  }

  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}