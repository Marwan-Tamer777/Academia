part of 'app_cubit.dart';

@freezed
class AppStates with _$AppStates {
  const factory AppStates.initial() = _Initial;
  const factory AppStates.loading() = _Loading;
  const factory AppStates.changeTheme(int themeCode) = _ChangeTheme;
  const factory AppStates.switchTheme() = _SwitchTheme;
  const factory AppStates.themeSwitched() = _ThemeSwitched;
  const factory AppStates.changeLanguage(int languageCode) = _ChangeLanguage;
  const factory AppStates.loaded() = _Loaded;
  const factory AppStates.error(String message) = _Error;
}
