import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';
part 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(const _Initial());

  static LoginCubit getCubit(context) => BlocProvider.of(context);

  void validatePassword(String password) {
    if (password.isEmpty) {
      emit(const _Error(
        "Password can't be empty!",
      ));
    } else if (!passwordValidator(password.toString())) {
      emit(const _Error(
          "Weak Password. password must contain numerical digit and at least 8 characters long."));
    } else {
      emit(const _Loaded());
      return;
    }
  }

  String authenticate({
    required String email,
    required String password,
  }) {
    // send data to API
    return "";
  }

  bool passwordValidator(String value) {
    RegExp regExp = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (regExp.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }
}
