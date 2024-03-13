import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/shared_preference_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'style_manager.dart';
import 'values_manager.dart';

class ThemeManager {
  final SharedPrefManager _sharedPrefs;
  ThemeManager(this._sharedPrefs);
  bool get isDarkMode {
    bool? isDarkMode = _sharedPrefs.isDarkMode;
    isDarkMode ??=
        SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
    return isDarkMode;
  }

  ThemeData switchCurrentTheme() {
    _sharedPrefs.setDarkMode(!isDarkMode);
    return getApplicationTheme();
  }

  ThemeData getApplicationTheme({bool? dark}) {
    if (dark ?? isDarkMode) {
      return semiDarkMode;
    } else {
      return lightMode;
    }
  }

  static final ThemeData lightMode = ThemeData(
    primaryColor: ColorManager.lightOrangeStatusBar,
    primaryColorLight: ColorManager.lightOrangeStatusBar,
    primaryColorDark: ColorManager.lightOrangeStatusBar,
    disabledColor: ColorManager.lightGrey,
    splashColor: ColorManager.lightWhite.withOpacity(0.5),
    scaffoldBackgroundColor: ColorManager.lightBackground,
    canvasColor: ColorManager.lightCanvas,
    colorScheme: const ColorScheme.light(
      primary: ColorManager.white,
      secondary: ColorManager.white,
      surface: ColorManager.lightBackground,
      background: ColorManager.lightBackground,
      error: ColorManager.lightError,
      onPrimary: ColorManager.lightBlack,
      onSecondary: ColorManager.lightBlack,
      onSurface: ColorManager.lightBlack,
      onBackground: ColorManager.lightBlack,
      onError: ColorManager.lightBlack,
    ),
    // 1 Card Theme
    cardTheme: const CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.lightGrey,
      elevation: AppSize.s4,
    ),

    // 2 App bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.lightBackground,
      centerTitle: true,
      elevation: AppSize.s0,
      shadowColor: ColorManager.lightGrey,
      titleTextStyle: getRegularTextStyle(
        fontSize: FontSize.s34,
        color: ColorManager.lightBlack,
      ),
      actionsIconTheme: const IconThemeData(
        color: ColorManager.lightBlack,
      ),
      iconTheme: const IconThemeData(
        color: ColorManager.lightBlack,
      ),
    ),

    // 3 Button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.lightGrey,
      buttonColor: ColorManager.lightPrimary,
      splashColor: ColorManager.darkPrimary,
    ),

    // 4 Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          getMediumTextStyle(
            fontSize: FontSize.s14,
            color: ColorManager.white,
          ),
        ),
        splashFactory: InkSplash.splashFactory,
        backgroundColor: MaterialStateProperty.all(ColorManager.buttonColor),
        overlayColor: MaterialStateProperty.all(
          ColorManager.lightGrey.withOpacity(0.4),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
          ),
        ),
      ),
    ),

    // 5 Text theme
    textTheme: TextTheme(
      displayLarge: getBoldTextStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s34,
        fontFamily: FontConstants.cairo,
      ),
      displayMedium: getSemiBoldTextStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s24,
        fontFamily: FontConstants.cairo,
      ),
      displaySmall: getRegularTextStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s18,
        fontFamily: FontConstants.cairo,
      ),
      bodyLarge: getSemiBoldTextStyle(
        fontSize: FontSize.s16,
        color: ColorManager.lightBlack,
        fontFamily: FontConstants.cairo,
      ),
      bodyMedium: getRegularTextStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s16,
        fontFamily: FontConstants.cairo,
      ),
      bodySmall: getMediumTextStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s14,
        fontFamily: FontConstants.cairo,
      ),
      titleLarge: getRegularTextStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s14,
        fontFamily: FontConstants.cairo,
      ),
      titleMedium: getMediumTextStyle(
        fontSize: FontSize.s14,
        color: ColorManager.lightFormText,
        fontFamily: FontConstants.cairo,
      ),
      titleSmall: getRegularTextStyle(
        fontSize: FontSize.s11,
        color: ColorManager.lightGrey,
        fontFamily: FontConstants.cairo,
      ),
      labelLarge: getBoldTextStyle(
        fontSize: FontSize.s28,
        color: ColorManager.lightBlack,
        fontFamily: FontConstants.cairo,
      ),
      labelMedium: getSemiBoldTextStyle(
        fontSize: FontSize.s20,
        color: ColorManager.black,
        fontFamily: FontConstants.cairo,
      ),
      labelSmall: getRegularTextStyle(
        fontSize: FontSize.s14,
        color: ColorManager.lightGrey,
        fontFamily: FontConstants.cairo,
        decoration: TextDecoration.lineThrough,
        decorationColor: ColorManager.lightGrey,
        decorationThickness: AppSize.s3,
      ),
    ),

    // 6 Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.lightWhite,

      contentPadding: const EdgeInsets.symmetric(
        vertical: AppSize.s16,
        horizontal: AppSize.s20,
      ),

      hintStyle: getMediumTextStyle(
        fontSize: FontSize.s14,
        color: ColorManager.lightGrey,
      ),

      labelStyle: getMediumTextStyle(
        fontSize: FontSize.s14,
        color: ColorManager.lightGrey,
        fontFamily: FontConstants.cairo,
      ),

      errorStyle: getRegularTextStyle(
        fontSize: FontSize.s11,
        color: ColorManager.lightError,
      ),

      // Enabled border
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
      ),

      // Focused border
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.lightOrangeStatusBar,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
      ),

      // Error border
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.lightError,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
      ),
      // Focused error border
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.lightError,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
      ),
    ),

    // 7 Bottom navigation bar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.lightBackground,
      selectedItemColor: ColorManager.lightPrimary,
      unselectedItemColor: ColorManager.lightGrey,
      selectedLabelStyle: getRegularTextStyle(
        fontSize: FontSize.s11,
        color: ColorManager.lightPrimary,
      ),
      showUnselectedLabels: true,
      elevation: AppSize.s1,
      unselectedLabelStyle: getRegularTextStyle(
        fontSize: FontSize.s11,
        color: ColorManager.lightGrey,
      ),
    ),

    // 8 text button theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorManager.lightBlack,
      ),
    ),
    // 9 checkbox theme
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(ColorManager.lightPrimary),
      checkColor: MaterialStateProperty.all(ColorManager.lightWhite),
      overlayColor: MaterialStateProperty.all(ColorManager.lightPrimary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s4),
      ),
    ),

    // 10 floating action button theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorManager.lightPrimary,
    ),

    // 11 Icon theme
    iconTheme: const IconThemeData(
      color: ColorManager.lightBlack,
    ),

    // 12 outlined button theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ColorManager.lightBlack,
        backgroundColor: ColorManager.lightPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s25),
        ),
        side: const BorderSide(
          color: ColorManager.lightPrimary,
          width: AppSize.s1,
        ),
      ),
    ),

    // 00 Extension
    extensions: const [
      CustomThemeExtension(
        overlayColor: ColorManager.lightSales,
        patternAppBarColor: ColorManager.darkBlueBackground,
        complementaryColor: ColorManager.black,
        greenOverlayColor: ColorManager.lightExternalGreenOverlay,
        successColor: ColorManager.lightSuccessText,
        navBarColor: ColorManager.lightNavigationBar,
        pageIndicatorColor: ColorManager.buttonColor,
        themeIcon: Icons.light_mode,
        courseIcon: ImageAssets.courseIcon,
      )
    ],
  );

  static final ThemeData semiDarkMode = ThemeData(
    primaryColor: ColorManager.semiDarkSecondary,
    primaryColorLight: ColorManager.semiDarkSecondary,
    primaryColorDark: ColorManager.semiDarkSecondary,
    disabledColor: ColorManager.darkGrey,
    splashColor: ColorManager.darkGrey.withOpacity(0.5),
    scaffoldBackgroundColor: ColorManager.semiDarkBackground,
    canvasColor: ColorManager.semiDarkElement,
    colorScheme: const ColorScheme.dark(
      primary: ColorManager.semiDarkSecondary,
      secondary: ColorManager.semiDarkSecondary,
      surface: ColorManager.darkBackground,
      background: ColorManager.darkBackground,
      error: ColorManager.darkError,
      onPrimary: ColorManager.darkWhite,
      onSecondary: ColorManager.darkWhite,
      onSurface: ColorManager.darkWhite,
      onBackground: ColorManager.darkWhite,
      onError: ColorManager.darkWhite,
    ),
    // 1 Card Theme
    cardTheme: const CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.darkGrey,
      elevation: AppSize.s4,
    ),

    // 2 App bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.darkBackground,
      centerTitle: true,
      elevation: AppSize.s0,
      shadowColor: ColorManager.darkGrey,
      titleTextStyle: getRegularTextStyle(
        fontSize: FontSize.s34,
        color: ColorManager.darkWhite,
      ),
      actionsIconTheme: const IconThemeData(
        color: ColorManager.darkWhite,
      ),
      iconTheme: const IconThemeData(
        color: ColorManager.darkWhite,
      ),
    ),

    // 3 Button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.darkGrey,
      buttonColor: ColorManager.darkPrimary,
      splashColor: ColorManager.lightPrimary,
    ),

    // 4 Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          getMediumTextStyle(
            fontSize: FontSize.s14,
            color: ColorManager.semiDarkText,
          ),
        ),
        splashFactory: InkSplash.splashFactory,
        backgroundColor:
            MaterialStateProperty.all(ColorManager.semiDarkSecondary),
        overlayColor: MaterialStateProperty.all(
          ColorManager.lightGrey.withOpacity(0.4),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
          ),
        ),
      ),
    ),

    // 5 Text theme
    textTheme: TextTheme(
      displayLarge: getBoldTextStyle(
        color: ColorManager.semiDarkText,
        fontSize: FontSize.s34,
        fontFamily: FontConstants.cairo,
      ),
      displayMedium: getSemiBoldTextStyle(
        color: ColorManager.semiDarkText,
        fontSize: FontSize.s24,
        fontFamily: FontConstants.cairo,
      ),
      displaySmall: getRegularTextStyle(
        color: ColorManager.semiDarkText,
        fontSize: FontSize.s18,
      ),
      bodyLarge: getSemiBoldTextStyle(
        fontSize: FontSize.s16,
        color: ColorManager.semiDarkText,
        fontFamily: FontConstants.cairo,
      ),
      bodyMedium: getRegularTextStyle(
        color: ColorManager.semiDarkText,
        fontSize: FontSize.s16,
        fontFamily: FontConstants.cairo,
      ),
      bodySmall: getMediumTextStyle(
        color: ColorManager.semiDarkText,
        fontSize: FontSize.s14,
      ),
      titleLarge: getRegularTextStyle(
        color: ColorManager.darkWhite,
        fontSize: FontSize.s14,
        fontFamily: FontConstants.cairo,
      ),
      titleMedium: getMediumTextStyle(
        fontSize: FontSize.s14,
        color: ColorManager.darkWhiteSecondary,
        fontFamily: FontConstants.cairo,
      ),
      titleSmall: getRegularTextStyle(
        fontSize: FontSize.s11,
        color: ColorManager.darkGrey,
        fontFamily: FontConstants.cairo,
      ),
      labelLarge: getBoldTextStyle(
        fontSize: FontSize.s28,
        color: ColorManager.semiDarkText,
        fontFamily: FontConstants.cairo,
      ),
      labelMedium: getMediumTextStyle(
        fontSize: FontSize.s20,
        color: ColorManager.semiDarkText,
        fontFamily: FontConstants.cairo,
      ),
      labelSmall: getRegularTextStyle(
        fontSize: FontSize.s18,
        color: ColorManager.lightGrey,
        decoration: TextDecoration.lineThrough,
        decorationColor: ColorManager.lightGrey,
        decorationThickness: AppSize.s3,
      ),
    ),

    // 6 Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.semiDarkElement,

      contentPadding: const EdgeInsets.all(AppPadding.p16),

      hintStyle: getMediumTextStyle(
        fontSize: FontSize.s14,
        color: ColorManager.darkGrey,
      ),

      labelStyle: getMediumTextStyle(
        fontSize: FontSize.s14,
        color: ColorManager.semiDarkText,
        fontFamily: FontConstants.cairo,
      ),
      errorStyle: getRegularTextStyle(
        fontSize: FontSize.s11,
        color: ColorManager.darkError,
      ),

      // Enabled border
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
      ),

      // Focused border
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.semiDarkSecondary,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
      ),

      // Error border
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.darkError,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
      ),
      // Focused error border
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.darkError,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
      ),
    ),

    // 7 Bottom navigation bar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.darkBackground,
      selectedItemColor: ColorManager.darkPrimary,
      unselectedItemColor: ColorManager.darkGrey,
      selectedLabelStyle: getRegularTextStyle(
        fontSize: FontSize.s11,
        color: ColorManager.darkPrimary,
      ),
      showUnselectedLabels: true,
      elevation: AppSize.s1,
      unselectedLabelStyle: getRegularTextStyle(
        fontSize: FontSize.s11,
        color: ColorManager.darkGrey,
      ),
    ),

    // 8 text button theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorManager.darkWhite,
      ),
    ),

    // 9 checkbox theme
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(ColorManager.darkPrimary),
      checkColor: MaterialStateProperty.all(ColorManager.darkWhite),
      overlayColor: MaterialStateProperty.all(ColorManager.darkPrimary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s4),
      ),
    ),

    // 10 floating action button theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorManager.darkPrimary,
    ),

    // 11 Icon theme
    iconTheme: const IconThemeData(
      color: ColorManager.darkWhite,
    ),
    // 00 Extension
    extensions: const [
      CustomThemeExtension(
        patternAppBarColor: ColorManager.semiDarkPatternMask,
        overlayColor: ColorManager.darkSales,
        complementaryColor: ColorManager.white,
        greenOverlayColor: ColorManager.darkExternalGreenOverlay,
        successColor: ColorManager.semiDarkSuccessText,
        navBarColor: ColorManager.darkNavigationBar,
        pageIndicatorColor: ColorManager.semiDarkSecondary,
        themeIcon: Icons.dark_mode,
        courseIcon: ImageAssets.courseIconDark,
      ),
    ],
  );

  static final ThemeData darkMode = ThemeData(
    primaryColor: ColorManager.darkPrimary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.darkGrey,
    splashColor: ColorManager.darkGrey.withOpacity(0.5),
    scaffoldBackgroundColor: ColorManager.darkBackground,
    canvasColor: ColorManager.darkBackground,
    colorScheme: const ColorScheme.dark(
      primary: ColorManager.darkPrimary,
      secondary: ColorManager.darkPrimary,
      surface: ColorManager.darkBackground,
      background: ColorManager.darkBackground,
      error: ColorManager.darkError,
      onPrimary: ColorManager.darkWhite,
      onSecondary: ColorManager.darkWhite,
      onSurface: ColorManager.darkWhite,
      onBackground: ColorManager.darkWhite,
      onError: ColorManager.darkWhite,
    ),
    // 1 Card Theme
    cardTheme: const CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.darkGrey,
      elevation: AppSize.s4,
    ),

    // 2 App bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.darkBackground,
      centerTitle: true,
      elevation: AppSize.s0,
      shadowColor: ColorManager.darkGrey,
      titleTextStyle: getRegularTextStyle(
        fontSize: FontSize.s34,
        color: ColorManager.darkWhite,
      ),
      actionsIconTheme: const IconThemeData(
        color: ColorManager.darkWhite,
      ),
      iconTheme: const IconThemeData(
        color: ColorManager.darkWhite,
      ),
    ),

    // 3 Button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.darkGrey,
      buttonColor: ColorManager.darkPrimary,
      splashColor: ColorManager.lightPrimary,
    ),

    // 4 Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          getMediumTextStyle(
            fontSize: FontSize.s14,
            color: ColorManager.white,
            fontFamily: FontConstants.cairo,
          ),
        ),
        splashFactory: InkSplash.splashFactory,
        backgroundColor: MaterialStateProperty.all(ColorManager.darkPrimary),
        overlayColor: MaterialStateProperty.all(
          ColorManager.darkGrey.withOpacity(0.4),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s6)),
          ),
        ),
      ),
    ),

    // 5 Text theme
    textTheme: TextTheme(
      displayLarge: getBoldTextStyle(
        color: ColorManager.darkWhite,
        fontSize: FontSize.s34,
      ),
      displayMedium: getSemiBoldTextStyle(
        color: ColorManager.darkWhite,
        fontSize: FontSize.s24,
      ),
      displaySmall: getRegularTextStyle(
        color: ColorManager.darkWhite,
        fontSize: FontSize.s18,
      ),
      bodyLarge: getSemiBoldTextStyle(
        fontSize: FontSize.s16,
        color: ColorManager.darkWhite,
      ),
      bodyMedium: getRegularTextStyle(
        color: ColorManager.darkWhite,
        fontSize: FontSize.s16,
      ),
      bodySmall: getMediumTextStyle(
        color: ColorManager.darkWhite,
        fontSize: FontSize.s14,
      ),
      titleLarge: getRegularTextStyle(
        color: ColorManager.darkWhite,
        fontSize: FontSize.s14,
      ),
      titleMedium: getMediumTextStyle(
        fontSize: FontSize.s14,
        color: ColorManager.darkWhiteSecondary,
      ),
      titleSmall: getRegularTextStyle(
        fontSize: FontSize.s11,
        color: ColorManager.darkGrey,
      ),
      labelMedium: getSemiBoldTextStyle(
        fontSize: FontSize.s18,
        color: ColorManager.white,
      ),
      labelSmall: getRegularTextStyle(
        fontSize: FontSize.s18,
        color: ColorManager.lightGrey,
        decoration: TextDecoration.lineThrough,
        decorationColor: ColorManager.lightGrey,
        decorationThickness: AppSize.s3,
      ),
    ),

    // 6 Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.darkBlack,

      contentPadding: const EdgeInsets.all(AppPadding.p16),

      hintStyle: getMediumTextStyle(
        fontSize: FontSize.s14,
        color: ColorManager.darkGrey,
      ),

      labelStyle: getMediumTextStyle(
        fontSize: FontSize.s14,
        color: ColorManager.darkGrey,
      ),
      errorStyle: getRegularTextStyle(
        fontSize: FontSize.s11,
        color: ColorManager.darkError,
      ),

      // Enabled border
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.darkGrey,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
      ),

      // Focused border
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.darkBackground,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
      ),

      // Error border
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.darkError,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
      ),
      // Focused error border
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.darkError,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
      ),
    ),

    // 7 Bottom navigation bar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.darkBackground,
      selectedItemColor: ColorManager.darkPrimary,
      unselectedItemColor: ColorManager.darkGrey,
      selectedLabelStyle: getRegularTextStyle(
        fontSize: FontSize.s11,
        color: ColorManager.darkPrimary,
      ),
      showUnselectedLabels: true,
      elevation: AppSize.s1,
      unselectedLabelStyle: getRegularTextStyle(
        fontSize: FontSize.s11,
        color: ColorManager.darkGrey,
      ),
    ),

    // 8 text button theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorManager.darkWhite,
      ),
    ),

    // 9 checkbox theme
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(ColorManager.darkPrimary),
      checkColor: MaterialStateProperty.all(ColorManager.darkWhite),
      overlayColor: MaterialStateProperty.all(ColorManager.darkPrimary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s4),
      ),
    ),

    // 10 floating action button theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorManager.darkPrimary,
    ),

    // 11 Icon theme
    iconTheme: const IconThemeData(
      color: ColorManager.darkWhite,
    ),
    // 00 Extension
    extensions: const [
      CustomThemeExtension(
        overlayColor: ColorManager.darkSales,
        patternAppBarColor: ColorManager.darkPrimary,
        complementaryColor: ColorManager.white,
        greenOverlayColor: ColorManager.darkExternalGreenOverlay,
        successColor: ColorManager.semiDarkSuccessText,
        navBarColor: ColorManager.darkNavigationBar,
        pageIndicatorColor: ColorManager.semiDarkSecondary,
        themeIcon: Icons.dark_mode,
        courseIcon: ImageAssets.courseIconDark,
      ),
    ],
  );
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color overlayColor;
  final Color patternAppBarColor;
  final Color complementaryColor;
  final Color greenOverlayColor;
  final Color successColor;
  final Color navBarColor;
  final Color pageIndicatorColor;
  final IconData themeIcon;
  final String courseIcon;

  const CustomThemeExtension({
    required this.overlayColor,
    required this.patternAppBarColor,
    required this.complementaryColor,
    required this.greenOverlayColor,
    required this.successColor,
    required this.navBarColor,
    required this.pageIndicatorColor,
    required this.themeIcon,
    required this.courseIcon,
  });

  @override
  CustomThemeExtension copyWith({
    Color? overlayColor,
    Color? patternAppBarColor,
    Color? complementaryColor,
    Color? greenOverlayColor,
    Color? successColor,
    Color? navBarColor,
    Color? pageIndicatorColor,
    IconData? themeIcon,
    String? courseIcon,
  }) {
    return CustomThemeExtension(
      overlayColor: overlayColor ?? this.overlayColor,
      patternAppBarColor: patternAppBarColor ?? this.patternAppBarColor,
      complementaryColor: complementaryColor ?? this.complementaryColor,
      greenOverlayColor: greenOverlayColor ?? this.greenOverlayColor,
      successColor: successColor ?? this.successColor,
      navBarColor: navBarColor ?? this.navBarColor,
      pageIndicatorColor: pageIndicatorColor ?? this.pageIndicatorColor,
      themeIcon: themeIcon ?? this.themeIcon,
      courseIcon: courseIcon ?? this.courseIcon,
    );
  }

  @override
  CustomThemeExtension lerp(covariant CustomThemeExtension? other, double t) {
    return this;
  }
}
