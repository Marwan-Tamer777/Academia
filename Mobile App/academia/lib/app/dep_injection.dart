import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_source/local/local_data_source.dart';
import '../data/data_source/remote/remote_data_source.dart';
import '../data/network/app_service/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../data/repository_impl/repository_impl.dart';
import '../domain/repository/repository.dart';
import '../presentation/resources/shared_preference_manager.dart';
import '../presentation/resources/theme_manager.dart';


final getItInstance = GetIt.instance;
Future<void> initAppModule() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getItInstance
      .registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  getItInstance.registerLazySingleton<SharedPrefManager>(
      () => SharedPrefManager(getItInstance<SharedPreferences>()));

  getItInstance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  getItInstance.registerLazySingleton<DioFactory>(
      () => DioFactory(getItInstance<SharedPrefManager>()));

  Dio dio = await getItInstance<DioFactory>().getDio();

  getItInstance.registerLazySingleton<AppAPIServiceClient>(
      () => AppAPIServiceClient(dio));

  getItInstance.registerLazySingleton<ThemeManager>(
      () => ThemeManager(getItInstance<SharedPrefManager>()));

  getItInstance
      .registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  getItInstance.registerLazySingleton<RemoteAPIDataSource>(
      () => RemoteAPIDataSourceImpl(getItInstance<AppAPIServiceClient>()));

  getItInstance.registerLazySingleton<Repository>(() => RepositoryImpl(
        getItInstance<RemoteAPIDataSource>(),
        getItInstance<LocalDataSource>(),
        getItInstance<NetworkInfo>(),
      ));

  /// Initialize Blocs
  // if (!getItInstance.isRegistered<UseCaseImpl>()) {
  //   getItInstance.registerFactory<UseCaseImpl>(
  //       () => UseCaseImpl(getItInstance<Repository>()));
  //   getItInstance.registerFactory<ProductsBloc>(
  //     () => ProductsBloc(getItInstance<UseCaseImpl>()),
  //   );
  //   getItInstance.registerFactory<AuthBloc>(
  //     () => AuthBloc(getItInstance<UseCaseImpl>()),
  //   );
  // }
}
