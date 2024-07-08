import 'package:get/get.dart';
import 'package:academia/app/language/ar.dart';
import 'package:academia/app/language/en.dart';

class AppLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      'ar': en,
       'en': ar,
    };
  }
}
