import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  final SharedPreferences prefs;
  SharedPrefManager(this.prefs);
  static const String _themeMode = 'themeMode';

  int? get getTheme {
    return prefs.getInt(_themeMode);
  }

  Future<void> setThemeMode(int value) async {
    prefs.setInt(_themeMode, value);
  }
}
