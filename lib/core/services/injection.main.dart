part of 'injection.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initUtility();
  await _initOnboarding();
  await _initAuthentication();
}

Future<void> _initUtility() async {
  final prefs = await SharedPreferences.getInstance();
  final client = http.Client();

  sl
    ..registerFactory(
      () => InternetCubit(connectivity: sl()),
    )
    ..registerLazySingleton(() => prefs)
    ..registerLazySingleton(
      () => StorageService(sl()),
    )
    ..registerLazySingleton(
      () => Connectivity(),
    )
    ..registerLazySingleton(
      () => PageController(),
    )
    ..registerLazySingleton(() => client);
}

Future<void> _initOnboarding() async {
  sl
    ..registerFactory(
      () => OnboardingCubit(
        checkIfUserIsFirstTimer: sl(),
        cacheFirstTimer: sl(),
      ),
    )
    ..registerLazySingleton(
      () => CacheFirstTimer(sl()),
    )
    ..registerLazySingleton(
      () => CheckIfUserIsFirstTimer(sl()),
    )
    ..registerLazySingleton<OnboardingRepository>(
      () => OnboardingRepoImplementation(sl()),
    )
    ..registerLazySingleton<OnboardingLocalDatasource>(
      () => OnboardingLocalDatasourceImplementation(sl()),
    );
}

Future<void> _initAuthentication() async {
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
    ..registerLazySingleton(
      () => GoogleSSO(sl()),
    )
    ..registerLazySingleton(
      () => Login(sl()),
    )
    ..registerLazySingleton(
      () => Register(sl()),
    )
    ..registerLazySingleton(
      () => ForgotPassword(sl()),
    )
    ..registerLazySingleton(
      () => UpdateUser(sl()),
    )
    ..registerLazySingleton(
      () => CacheCredentials(sl()),
    )
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
    ..registerLazySingleton(() => FirebaseStorage.instance);
}
