import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/quiz/cubit/assignments_cubit/assignments_cubit.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/profile/profile_cubit/profile_cubit.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/quiz/cubit/quiz_cubit/quiz_cubit.dart';
import 'package:academia/presentation/screens/course_screen/cubit/course_cubit.dart';
import 'package:academia/presentation/screens/login/cubit/login_cubit.dart';
import 'package:academia/presentation/screens/take_quiz_screen/take_quiz_screen_cubit/take_quiz_screen_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/data_source/local/local_data_source.dart';
import '../data/data_source/remote/remote_data_source.dart';
import '../data/network/app_service/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../presentation/resources/shared_preference_manager.dart';
import '../presentation/resources/theme_manager.dart';
import '../presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/courses/Courses_cubit/courses_cubit.dart';


final getItInstance = GetIt.instance;
Future<void> initAppModule() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getItInstance
      .registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  getItInstance.registerLazySingleton<SharedPrefManager>(
      () => SharedPrefManager());

  getItInstance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  getItInstance.registerLazySingleton<DioFactory>(
      () => DioFactory(getItInstance<SharedPrefManager>()));

  Dio dio = await getItInstance<DioFactory>().getDio();

  getItInstance.registerLazySingleton<ThemeManager>(
      () => ThemeManager(getItInstance<SharedPrefManager>()));

  getItInstance
      .registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  getItInstance.registerLazySingleton<RemoteAPIDataSource>(
      () => RemoteAPIDataSourceImpl(getItInstance<AppAPIServiceClient>()));





  getItInstance.registerLazySingleton<LoginCubit>(
          () => LoginCubit());

  getItInstance.registerLazySingleton<CoursesCubit>(
          () => CoursesCubit());

  getItInstance.registerLazySingleton<BottomNavBarCubit>(
          () => BottomNavBarCubit());


  getItInstance.registerLazySingleton<ProfileCubit>(
          () => ProfileCubit()); 

  getItInstance.registerLazySingleton<AssignmentsCubit>(
          () => AssignmentsCubit()); 

  getItInstance.registerLazySingleton<QuizCubit>(
          () => QuizCubit()); 

    getItInstance.registerLazySingleton<TakeQuizCubit>(
          () => TakeQuizCubit()); 

        getItInstance.registerLazySingleton<CourseCubit>(
          () => CourseCubit());
}
