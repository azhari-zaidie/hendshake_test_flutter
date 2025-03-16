part of 'init_dependencies.main.dart';


GetIt serviceLocator = GetIt.instance;

// initialize dependencies injection
Future<void> initDependencies() async {
  // Initialize Hive
  await initHive();

  _initProvider();
  _initActivity();
  _initHistory();
  SharedPreferences localStore = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferences>(() => localStore);
  // await Get.putAsync(() => AuthService().init());
}

void _initProvider() {
  // inittialize common providers
  serviceLocator
  ..registerLazySingleton<HomeProvider>(() => HomeProvider(serviceLocator()))
  ..registerLazySingleton<GetInfoProvider>(() => GetInfoProvider(serviceLocator()));
}

void _initActivity() {
  serviceLocator
   ..registerFactory<ActivityLocalDs>(() => ActivityLocalDsImpl())
   ..registerFactory<ActivityDs>(() => ActivityDsImpl(localDs: serviceLocator()))
   ..registerFactory<ActivityRepository>(() => ActivityRepositoryImpl(serviceLocator()))
   ..registerFactory<GetActivityCase>(() => GetActivityCase(serviceLocator()))
   ..registerLazySingleton<ActivityProvider>(() => ActivityProvider(serviceLocator(), serviceLocator()));
}

void _initHistory() {
  serviceLocator
   ..registerFactory<HistoryDs>(() => HistoryDsImpl())
   ..registerFactory<HistoryRepository>(() => HistoryRepositoryImpl(serviceLocator()))
   ..registerFactory<GetHistoryCase>(() => GetHistoryCase(serviceLocator()))
   ..registerLazySingleton<HistoryProvider>(() => HistoryProvider(serviceLocator(),serviceLocator()));
}
