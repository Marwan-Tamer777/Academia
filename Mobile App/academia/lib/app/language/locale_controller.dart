import 'package:academia/presentation/resources/shared_preference_manager.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

class MyLocaleController extends GetxController {

  Locale initialLanguage = SharedPrefManager.getDataString(key: 'lang') == null
      ? const Locale('en')
      : Locale(SharedPrefManager.getDataString(key: 'lang')!); 

  bool isArabicLanguage() {
    if (SharedPrefManager.getDataString(key: 'lang') == 'ar') {
      return true;
    } else {
      return false;
    }
  }

  void setLocale(String lang) {
    Locale newLocale = Locale(lang);
    SharedPrefManager.put(key: 'lang', value: lang);
    Get.updateLocale(newLocale);
  }
}