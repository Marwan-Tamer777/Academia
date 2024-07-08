import 'package:academia/domain/models/user.dart';

abstract class AppConstants {
  static const String apiKey = "PDIyxNGFARfkRebwiVGg3blk";
  static const String baseUrl = "https://api.bestbuy.com/v1";
  static const int apiTimeoutMs = 4500;
  static const int splashTime = 4;
  static const int animationTime = 1500;
  static const int onboardingPages = 3;
  static const int sliderAnimationTime = 300;
}

String? userToken;
String? userId; 
User? userData;
