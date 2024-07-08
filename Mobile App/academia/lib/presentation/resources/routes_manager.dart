import 'package:academia/domain/models/course.dart';
import 'package:academia/domain/models/post.dart';
import 'package:academia/domain/models/quiz.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_layout.dart';
import 'package:academia/presentation/screens/comments_screen/comments_screen.dart';
import 'package:academia/presentation/screens/course_screen/course_screen.dart';
import 'package:academia/presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:academia/presentation/screens/forgot_password/verification_screen.dart';
import 'package:academia/presentation/screens/forgot_password/write_new_password_screen.dart';
import 'package:academia/presentation/screens/login/screens/login_screen.dart';
import 'package:academia/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../screens/onboarding/onboarding_screen.dart';
import '../screens/take_quiz_screen/screens/take_quiz_screen.dart';
import '../widgets/custom_text.dart';
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
  static const String courseScreen = '/courseScreen';
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
      case Routes.courseScreen: 
        final course = settings.arguments as Course;
        return MaterialPageRoute<dynamic>(
          builder: (_) => CourseScreen(course: course),
        );
      case Routes.takeQuizScreen:  
           Quiz quiz = settings.arguments as Quiz;
        return MaterialPageRoute<dynamic>( 
          builder: (_) => TakeQuizScreen(quiz: quiz),
        );
      case Routes.postComments:
          Post post = settings.arguments as Post;
        return MaterialPageRoute<dynamic>( 
          builder: (_) => CommentsScreen(post: post,),
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
        return Scaffold(
          body: Center(
            child: CustomText(text: AppStrings.undefinedRoute, style: Theme.of(_).textTheme.bodyMedium!),
          ),
        );
      },
    );
  }
}
