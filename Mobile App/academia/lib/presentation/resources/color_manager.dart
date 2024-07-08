import 'package:flutter/material.dart';

abstract class ColorManager {
  /// Common Colors
  /// New
  static const Color lightOrangeStatusBar = Color(0xFFff613d);
  static const Color formHint = Color(0xFFA3ACAC);
  static const Color externalOrangeOverlay = Color(0x1AFF7E31);

  /// Old
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);

  /// Light Theme Colors
  /// New
  static const Color darkBlueBackground = Color(0xFF0c2337);
  static const Color buttonColor = Color(0xFF0C2133);
  static const Color skipButtonColor = Color(0xFF0C2133);
  static const Color forgotPasswordMessageColor = Color(0xFF4E5556);
  static const Color lightExternalGreenOverlay = Color(0x76E9FFED);
  static const Color lightSuccessText = Color(0xFf517B2C);
  static const Color lightNavigationBar = Color(0xFF1D3149);
  static const Color lightPollColor = Color(0xFFe9eaed);

  /// Old
  static const Color lightBlack = Color(0xFF222222);
  static const Color lightGrey = Color(0xFF9b9b9b);
  static const Color lightGrey2 = Color(0xFFE5E5E5);
  static const Color lightGrey3 = Color.fromRGBO(163, 162, 169, 0.10);
  static const Color lightPrimary = Color(0xFFff613d);
  static const Color lightBackground = Color(0xFFF0F0F0);
  static const Color lightCanvas = Color(0xFFFBFCFE);
  static const Color lightFormText = Color(0xFF2D2D2D);
  static const Color lightWhite = Color(0xFFFFFFFF);
  static const Color lightError = Color(0xFFf01f0e);
  static const Color lightSales = Color(0xFFDB3022);

  static const Color lightGreen2 = Color(0xFFE9FFED);
  static const Color textOrange = Color(0xFFff7e31);
  static const Color lightOrange1 = Color(0x16FF7D31);
  static const Color calenderEmptyState = Color(0xFF7E3133);

  static const Color offWhite = Color(0xFFFBFCFE);
  static const Color bottomSheetBackground = Color(0xFFF0F0F0);
  static const Color success = Color.fromRGBO(81, 123, 44, 0.10);

  /// Semi Dark Theme Colors
  static const Color semiDarkBackground = Color(0xFF282828);
  static const Color semiDarkElement = Color(0xFF3C3C3C);
  static const Color semiDarkSecondary = Color(0xFFFF8C47);
  static const Color semiDarkText = Color(0xFFFBFCFE);
  static const Color semiDarkInactiveText = Color(0x8CFFFFFF);
  static const Color semiDarkSecondaryText = Color(0xFFFF8C47);
  static const Color semiDarkSuccessText = Color(0xFF88D941);
  static const Color semiDarkPatternMask = Color(0xFF3C302A);
  static const Color semiDarkPollColor = Color(0xFF525252);
  static const Color darkExternalGreenOverlay = Color(0x66748076);
  static const Color darkNavigationBar = Color(0xFF0A111A);

  /// Dark Theme Colors
  /// New
  static const Color darkCanvas = Color(0xFF282828);
  static const Color darkScaffold = Color(0xFF131313);

  /// Old
  static const Color darkWhiteSecondary = Color(0xFFF5F5F5);
  static const Color darkWhite = Color(0xFFf6f6f6);
  static const Color darkGrey = Color(0xFFa7a7a7);
  static const Color darkPrimary = Color(0xFFef3651);
  static const Color darkBackground = Color(0xFF1e1f28);
  static const Color darkBlack = Color(0xFF2a2c36);
  static const Color darkSales = Color(0xFFff3e3e);
  static const Color darkError = Color(0xFFff2424);
  // static const Color darkSuccess = Color(0xFF55d85a); 

  static Color opacityBlack = Colors.black.withOpacity(0.5);
}
