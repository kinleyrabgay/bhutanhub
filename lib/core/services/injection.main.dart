part of 'injection.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initUtility();
  await _initOnboarding();
  await _initAuthentication();
  await _initExplore();
  await _initPersonalization();
}

Future<void> _initUtility() async {
  final prefs = await SharedPreferences.getInstance();
  final client = http.Client();

  sl
    ..registerFactory(
      () => InternetCubit(connectivity: sl()),
    )
    ..registerLazySingleton(
      () => prefs,
    )
    ..registerLazySingleton(
      () => StorageService(sl()),
    )
    ..registerLazySingleton(
      () => TokenStore(sl()),
    )
    ..registerLazySingleton(
      () => Connectivity(),
    )
    ..registerLazySingleton(
      () => PageController(),
    )
    ..registerLazySingleton(
      () => ImagePicker(),
    )
    ..registerLazySingleton(
      () => client,
    )
    ..registerLazySingleton(
      () => Dio(),
    )
    ..registerLazySingleton(
      () => FirebaseAuth.instance,
    )
    ..registerLazySingleton(
      () => FirebaseFirestore.instance,
    )
    ..registerLazySingleton(
      () => FirebaseStorage.instance,
    );
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

Future<void> _initExplore() async {
  sl
    ..registerFactory(
      () => HomeBloc(
        fetchProduct: sl(),
      ),
    )
    ..registerLazySingleton(
      () => FetchProduct(sl()),
    )
    ..registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImplementation(
        remote: sl(),
      ),
    )
    ..registerLazySingleton<HomeRemoteDatasource>(
      () => HomeRemoteDatasourceImplementation(
        dio: sl(),
      ),
    );
}

Future<void> _initAuthentication() async {
  sl
    ..registerFactory(
      () => AuthenticationBloc(
        login: sl(),
        logout: sl(),
        register: sl(),
        forgotPassword: sl(),
        updateUser: sl(),
        sso: sl(),
        cacheCredentials: sl(),
        getCurrentUser: sl(),
      ),
    )
    ..registerLazySingleton(
      () => GoogleSSO(sl()),
    )
    ..registerLazySingleton(
      () => Login(sl()),
    )
    ..registerLazySingleton(
      () => Logout(sl()),
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
    ..registerLazySingleton(
      () => GetCurrentUser(sl()),
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
        client: sl(),
        dio: sl(),
        pref: sl(),
      ),
    )
    ..registerLazySingleton<AutheLocalDataSource>(
      () => AutheLocalDataSourceImplementation(
        storageService: sl(),
      ),
    );
}

Future<void> _initPersonalization() async {
  sl
    ..registerFactory(
      () => PersonalizationBloc(
        createProduct: sl(),
        upload: sl(),
      ),
    )
    ..registerLazySingleton(
      () => CreateProduct(sl()),
    )
    ..registerLazySingleton(
      () => Upload(sl()),
    )
    ..registerLazySingleton<UploadRepository>(
      () => UploadRepositoryImplementation(
        uploadRemoteDataSource: sl(),
      ),
    )
    ..registerLazySingleton<UploadRemoteDataSource>(
      () => UploadRemoteDataSourceImplementation(
        picker: sl(),
        dio: sl(),
      ),
    )
    ..registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImplementation(
        remoteDataSource: sl(),
      ),
    )
    ..registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImplementation(
        dio: sl(),
      ),
    );
}
