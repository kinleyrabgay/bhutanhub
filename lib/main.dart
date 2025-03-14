import 'package:bhutanhub/core/providers/user.provider.dart';
import 'package:bhutanhub/core/services/internet/internet_cubit.dart';
import 'package:bhutanhub/core/services/injection.dart';
import 'package:bhutanhub/core/services/router.dart';
import 'package:bhutanhub/core/utils/theme/theme.dart';
import 'package:bhutanhub/firebase_options.dart';
import 'package:bhutanhub/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:bhutanhub/src/features/bhutanhub/home/presentation/bloc/home_bloc.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/bloc/personalization_bloc.dart';
import 'package:bhutanhub/src/features/onboarding/presentations/cubit/onboarding_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  if (GetPlatform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseUIAuth.configureProviders([EmailAuthProvider()]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (_) => sl<InternetCubit>(),
        ),
        BlocProvider<OnboardingCubit>(
          create: (_) => sl<OnboardingCubit>(),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (_) => sl<AuthenticationBloc>(),
        ),
        BlocProvider<PersonalizationBloc>(
          create: (_) => sl<PersonalizationBloc>(),
        ),
        BlocProvider<HomeBloc>(
          create: (_) => sl<HomeBloc>(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Bhutan Hub',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        darkTheme: BHAppTheme.darkTheme,
        theme: BHAppTheme.lightTheme,
        builder: EasyLoading.init(),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
