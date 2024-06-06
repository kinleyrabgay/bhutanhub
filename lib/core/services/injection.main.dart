part of 'injection.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initConnectivity();
  await _initOnBoarding();
  await _initAuthentication();
}

Future<void> _initConnectivity() async {
  sl.registerLazySingleton(() => Connectivity());
  sl.registerFactory(() => InternetCubit(connectivity: sl()));
}

Future<void> _initOnBoarding() async {
  final prefs = await SharedPreferences.getInstance();

  sl
    ..registerLazySingleton(() => prefs)
    ..registerLazySingleton(() => StorageService(sl()));
}

Future<void> _initAuthentication() async {
  final client = http.Client();
  sl
    ..registerFactory(
      () => AuthenticationBloc(
        login: sl(),
        register: sl(),
        forgotPassword: sl(),
        updateUser: sl(),
        sso: sl(),
        cacheCredentials: sl(),
      ),
    )
    ..registerLazySingleton(() => GoogleSSO(sl()))
    ..registerLazySingleton(() => Login(sl()))
    ..registerLazySingleton(() => Register(sl()))
    ..registerLazySingleton(() => ForgotPassword(sl()))
    ..registerLazySingleton(() => UpdateUser(sl()))
    ..registerLazySingleton(() => CacheCredentials(sl()))
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImplementation(
        remoteDataSource: sl(),
        localDataSource: sl(),
      ),
    )
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImplementation(
        authClient: sl(),
        cloudStoreClient: sl(),
        dbClient: sl(),
        client: sl(),
      ),
    )
    ..registerLazySingleton<AutheLocalDataSource>(
      () => AutheLocalDataSourceImplementation(
        storageService: sl(),
      ),
    )
    ..registerLazySingleton(() => FirebaseAuth.instance)
    ..registerLazySingleton(() => FirebaseFirestore.instance)
    ..registerLazySingleton(() => FirebaseStorage.instance)
    ..registerLazySingleton(() => client);
}

// Future<void> _initOnBoarding() async {
//   final prefs = await SharedPreferences.getInstance();
//   sl
//     ..registerFactory(
//       () => OnBoardingCubit(
//         cacheFirstTimer: sl(),
//         checkIfUserIsFirstTimer: sl(),
//       ),
//     )
//     ..registerLazySingleton(() => CacheFirstTimer(sl()))
//     ..registerLazySingleton(() => CheckIfUserIsFirstTimer(sl()))
//     ..registerLazySingleton<OnBoardingRepo>(
//         () => OnBoardingRepoImplementation(sl()))
//     ..registerLazySingleton<OnBoardingLocalDatasource>(
//       () => OnboardingLocalDatasourceImplementation(sl()),
//     )
//     ..registerLazySingleton(() => prefs);
// }