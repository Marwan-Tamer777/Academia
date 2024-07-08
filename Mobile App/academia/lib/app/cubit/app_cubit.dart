import 'package:academia/app/dep_injection.dart';
import 'package:academia/presentation/resources/theme_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_cubit.freezed.dart';
part 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(const _Initial());
  ThemeManager themeManager = getItInstance<ThemeManager>();
  static AppCubit getCubit(context) => BlocProvider.of(context);

  void changeTheme() {
    emit(const _Loading());
    themeManager.cycleThroughTheme();
    emit(const _ThemeSwitched());
  }

  void changeThemeByIndex(int index) {
    emit(const _Loading());
    themeManager.switchCurrentTheme(mode: index);
    emit(const _Loaded());
  }
}
