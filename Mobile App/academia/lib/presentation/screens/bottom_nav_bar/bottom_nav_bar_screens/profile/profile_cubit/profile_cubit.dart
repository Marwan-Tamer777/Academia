import 'package:academia/app/constants.dart';
import 'package:academia/app/dep_injection.dart';
import 'package:academia/app/language/locale_controller.dart';
import 'package:academia/data/network/dio_helpers/dio_helpers.dart';
import 'package:academia/data/network/dio_helpers/end_points.dart';
import 'package:academia/domain/models/main_schema.dart';
import 'package:academia/domain/models/user.dart';
import 'package:academia/presentation/resources/shared_preference_manager.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/courses/Courses_cubit/courses_cubit.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/profile/profile_cubit/profile_states.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../resources/routes_manager.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState()) {
     getCurrentUser();
  }

  static ProfileCubit get(context) => BlocProvider.of(context); 

  MyLocaleController localeController = Get.find<MyLocaleController>();


  List<String> languages = [AppStrings.arabic.tr, AppStrings.english.tr];
  String? selectedLanguage;

  void changeLanguage(String language) {
    selectedLanguage = language;

    if(language == AppStrings.english.tr) {
      localeController.setLocale('ar');
    } else {
      localeController.setLocale('en');
    }
    emit(ChangeThemeState());
  } 

  void setThemes() {
    if(SharedPrefManager.getString('lang') == null) {
      selectedLanguage = languages[0];
    } else {
      selectedLanguage = SharedPrefManager.getString('lang') == 'en' ? languages[0] : languages[1];
    } 

    selectedTheme = themes[0]; 

    if(SharedPrefManager.getString('fontSize') != null) {
      selectedFontSize = SharedPrefManager.getString('fontSize'); 

      if(selectedFontSize == AppStrings.small.tr) {
        fontSize = -2;
      } else if(selectedFontSize == AppStrings.medium.tr) {
        fontSize = 4;
      } else {
        fontSize = 6;
      }
    } else {
      selectedFontSize = fontSizes[0];
    }
  }

  List<String> themes = [AppStrings.light.tr, AppStrings.dark.tr, AppStrings.semiDark.tr]; 
  String? selectedTheme; 

  void changeTheme(String theme) {
    selectedTheme = theme; 
    emit(ChangeThemeState());
  } 

  List<String> fontSizes = [AppStrings.small.tr, AppStrings.medium.tr, AppStrings.large.tr];
  String? selectedFontSize; 
  int fontSize = 0;

  void getSelectedFontSize() {
    selectedFontSize = SharedPrefManager.getString('fontSize') ?? fontSizes[0];
    emit(ChangeThemeState());
  }

  
  void changeFontSize(String font) {
    selectedFontSize = font; 
    SharedPrefManager.setString('fontSize', font);
    if(font == AppStrings.small.tr) {
      fontSize = -2;
    } else if(font == AppStrings.medium.tr) {
      fontSize = 3;
    } else {
      fontSize = 4;
    }
    emit(ChangeThemeState());
  }

  User? user;

  void getCurrentUser() async {
    emit(ProfileLoadingState());
    User? u = await getUserData(userId!);
      print("FRO FIN"); 


      if(u != null) { 
        user = u;
        userData = u; 
        getItInstance<CoursesCubit>().getCourses();
        emit(ProfileSuccessState());
      } else {
        emit(ProfileErrorState('Error'));
      } 
      
  }

  Future<User?> getUserData(String userId) async {
      try {
            final newUser = await DioHelper.getData(url:"${EndPoint.users}/$userId",token: userToken); 
    
    if(newUser != null) {
      User r = User.fromJson(newUser.data);
      return r;
    } 
      } catch(e) {
        return null;
      }
    }

    void logOut(BuildContext context) {
      SharedPrefManager.removeData(key: 'userToken');
      SharedPrefManager.removeData(key: 'userId');
      // navigate to login screen
      Navigator.pushNamedAndRemoveUntil(context, Routes.login, (route) => false);
    } 

    bool isOldPasswordShown = false; 
    bool isNewPasswordShown = false;
    bool isConfirmPasswordShown = false; 

    void showOldPassword() {
      isOldPasswordShown = !isOldPasswordShown; 
      emit(ShowOldPasswordState());
    } 

    void showNewPassword() {
      isNewPasswordShown = !isNewPasswordShown; 
      emit(ShowOldPasswordState());
    }

    void showConfirmPassword() {
      isConfirmPasswordShown = !isConfirmPasswordShown; 
      emit(ShowOldPasswordState());
    }


    void resetPassword(String email, String oldPassword, String newPassword) async {
      emit(ResetPasswordLoadingState());
      Map<String, dynamic> data = resetPasswordSchema(email: email, oldPassword: oldPassword, newPassword: newPassword);
      try {
        await DioHelper.postData(url: EndPoint.resetPassword, data: data).then((value) {
          if(value.statusCode == 200) {
            emit(ResetPasswordSuccessState());
          } else {
            emit(ResetPasswordErrorState(value.statusMessage.toString()));
          }
        }).catchError((error) {
          emit(ResetPasswordErrorState(error.toString()));
        });
      } catch (error) {
        emit(ResetPasswordErrorState(error.toString()));
      }
    }
}