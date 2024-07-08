import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static late SharedPreferences prefs;

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static const String _themeMode = 'themeMode';

  int? get getTheme {
    return prefs.getInt(_themeMode);
  }

  Future<void> setThemeMode(int value) async {
    prefs.setInt(_themeMode, value);
  }

  // function to set if it is the first time to open the app
  static Future<void> setString(String key, String value) async {
    await prefs.setString(key, value);
  }

  // function to get if it is the first time to open the app
  static String? getString(String key) {
    return prefs.getString(key);
  }

  // remove data using specific key
  static Future<bool> removeData({required String key}) async {
    return await prefs.remove(key);
  }

  // this fun to put data in local data base using key
  static Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await prefs.setString(key, value);
    } else if (value is bool) {
      return await prefs.setBool(key, value);
    } else {
      return await prefs.setInt(key, value);
    }
  }

// this fun to get data already saved in local data base

  static getDataString({
    required String key,
  }) {
    return prefs.get(key);
  }

  static bool? getDataBool({
    required String key,
  }) {
    return prefs.getBool(key);
  }


//clear all data in the local data base
  static Future<bool> clearData() async {
    return await prefs.clear();
  }
}
