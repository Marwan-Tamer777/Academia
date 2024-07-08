import 'package:academia/app/cubit/app_cubit.dart';
import 'package:academia/app/dep_injection.dart';
import 'package:academia/app/language/locale.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/courses/Courses_cubit/courses_cubit.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/profile/profile_cubit/profile_cubit.dart';
import 'package:academia/presentation/screens/onboarding/cubit/onboarding_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/resources/routes_manager.dart';
import '../app/language/locale_controller.dart';

import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocaleController localeController = Get.put(MyLocaleController());

    return MultiBlocProvider(
      providers: [ 
                    BlocProvider<ProfileCubit>(
              create: (context) => getItInstance<ProfileCubit>()..setThemes(),
            ),
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(),
        ),
        BlocProvider<OnboardingCubit>(
          create: (context) => OnboardingCubit(),
        ), 
            BlocProvider<BottomNavBarCubit>(
              create: (context) => getItInstance<BottomNavBarCubit>(),
            ),
      ],
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          final cubit = AppCubit.getCubit(context);
          return GetMaterialApp(
            title: AppStrings.appName,
            initialRoute: Routes.splashScreen,
            locale: localeController.initialLanguage,
            translations: AppLocale(),         
           onGenerateRoute: RoutesGenerator.getRoute,
            theme: cubit.themeManager.getApplicationTheme(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
