import 'package:academia/app/constants.dart';
import 'package:academia/app/dep_injection.dart';
import 'package:academia/data/network/dio_helpers/end_points.dart';
import 'package:academia/data/network/network_info.dart';
import 'package:academia/domain/models/main_schema.dart';
import 'package:academia/domain/models/user.dart';
import 'package:academia/presentation/resources/shared_preference_manager.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/profile/profile_cubit/profile_cubit.dart';
import 'package:academia/presentation/screens/login/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../data/network/dio_helpers/dio_helpers.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginLoadingState());

  static LoginCubit get(context) => BlocProvider.of(context); 

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  User? user;

  Future<void> authenticate() async { 
    print("Email: ${emailController.text}");
    print("Password: ${passwordController.text}");
    emit(LoginLoadingState());
        try {
          final Map<String, dynamic> data = {
            "email": emailController.text,
            "password": passwordController.text,
          };
          await DioHelper.postData(
              url: EndPoint.login,
              data: loginSchema(
                  data: data
              ))
              .then((value) {
            if(value.statusCode == 200){
                    user = User.fromJson(value.data["context"]["user"]);
                    userToken = value.data["context"]["user"]["token"];
                    userId = value.data["context"]["user"]["_id"];
                    SharedPrefManager.setString("userToken", userToken!);
                    SharedPrefManager.setString("userId", userId!); 
                    getItInstance<ProfileCubit>().getCurrentUser();
                    emit(LoginSuccessState()); 
                    emailController.clear();
                    passwordController.clear();
            } else {
              emit(LoginErrorState(AppStrings.loginError));
            }
          }).catchError((error) {
            emit(LoginErrorState(AppStrings.loginError));
          });
        } catch (e) {
          emit(LoginErrorState(AppStrings.loginError));
        }
  }







  void validatePassword(String password) {
    if (password.isEmpty) {
      emit(LoginErrorState(
        "Password can't be empty!",
      ));
    } else if (!passwordValidator(password.toString())) {
      emit(LoginErrorState(
          "Weak Password. password must contain numerical digit and at least 8 characters long."));
    } else {
      emit(LoginSuccessState());
      return;
    }
  }

  bool passwordValidator(String value) {
    RegExp regExp = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (regExp.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  } 

  bool showPassword = false; 
  void togglePasswordVisibility() {
    showPassword = !showPassword;
    emit(LoginPasswordVisibilityState());
  }
}
