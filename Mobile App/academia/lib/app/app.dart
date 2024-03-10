import 'package:academia/app/cubit/app_cubit.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/screens_cubit/screents_cubit.dart';
import 'package:academia/presentation/screens/onboarding/cubit/onboarding_cubit.dart';
import 'package:academia/presentation/screens/take_quiz_screen/take_quiz_screen.dart';
import 'package:academia/presentation/screens/take_quiz_screen/take_quiz_screen_cubit/take_quiz_screen_cubit.dart';
import 'package:academia/presentation/widgets/bottom_sheets/task_submission_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../presentation/resources/assets_manager.dart';
import '../presentation/resources/color_manager.dart';
import '../presentation/resources/font_manager.dart';
import '../presentation/resources/routes_manager.dart';
import '../presentation/resources/theme_manager.dart';
import '../presentation/resources/values_manager.dart';
import '../presentation/screens/login/cubit/login_cubit.dart';
import '../presentation/widgets/list_views_items/category_item.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<OnboardingCubit>(
          create: (context) => OnboardingCubit(),
        ),
        BlocProvider<BottomNavBarCubit>(
          create: (context) => BottomNavBarCubit(),
        ),
        BlocProvider<CoursesCubit>(
          create: (context) => CoursesCubit(),
        ),
        BlocProvider(create: (context) => QuizCubit()),
      ],
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          final cubit = AppCubit.getCubit(context);
          return MaterialApp(
            title: AppStrings.appName,
            initialRoute: Routes.splashScreen,
            onGenerateRoute: RoutesGenerator.getRoute,
            theme: cubit.themeManager.getApplicationTheme(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
