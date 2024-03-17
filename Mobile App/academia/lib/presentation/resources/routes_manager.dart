import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:academia/presentation/screens/comments_screen/comments_screen.dart';
import 'package:academia/presentation/screens/course_screen/course_screen.dart';
import 'package:academia/presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:academia/presentation/screens/forgot_password/verification_screen.dart';
import 'package:academia/presentation/screens/forgot_password/write_new_password_screen.dart';
import 'package:academia/presentation/screens/login/login_screen.dart';
import 'package:academia/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../screens/onboarding/onboarding_screen.dart';
import '../screens/take_quiz_screen/take_quiz_screen.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashScreen = '/';
  static const String getStarted = '/getStarted';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';
  static const String main = '/main';
  static const String onBoarding = '/onBoarding';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String forgotPasswordOtpScreen = '/forgotPasswordOtpScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';

  static const String bottomNavBar = '/bottomNavBar';
  static const String coursesScreen = '/coursesScreen';
  static const String takeQuizScreen = '/takeQuizScreen';
  static const String postComments = '/commentsScreen';

}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SplashScreen(),
        );
      case Routes.onBoarding:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.login:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const LoginScreen(),
        );
      case Routes.forgotPasswordScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const ForgotPasswordScreen(),
        );
      case Routes.forgotPasswordOtpScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const VerificationScreen(),
        );
      case Routes.resetPasswordScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const WriteNewPasswordScreen(),
        );

      case Routes.register:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Scaffold(),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Scaffold(),
        );
      case Routes.main:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Scaffold(),
        );
      case Routes.bottomNavBar:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const BottomNavBar(),
        );
      case Routes.coursesScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const CourseScreen(),
        );
      case Routes.takeQuizScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const TakeQuizScreen(),
        );
      case Routes.postComments:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const CommentsScreen(),
        );
      default:
        return undefinedRoute(settings);
    }
  }

  static Route<dynamic> undefinedRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) {
        if (kDebugMode) {
          print('Route not found: ${settings.name}');
        }
        return const Scaffold(
          body: Center(
            child: Text(AppStrings.undefinedRoute),
          ),
        );
      },
    );
  }
}
