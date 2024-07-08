import 'package:academia/data/network/dio_helpers/dio_helpers.dart';
import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/shared_preference_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/Bloc_Observer.dart';
import 'app/app.dart';
import 'app/dep_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefManager.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: ColorManager.lightOrangeStatusBar,
    statusBarIconBrightness: Brightness.light,
  ));
  await initAppModule();
  runApp(const MyApp());
}
