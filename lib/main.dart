import 'package:bhutan_hub/core/services/internet/internet_cubit.dart';
import 'package:bhutan_hub/core/services/injection.dart';
import 'package:bhutan_hub/core/services/router.dart';
import 'package:bhutan_hub/core/utils/theme/theme.dart';
import 'package:bhutan_hub/firebase_options.dart';
import 'package:bhutan_hub/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([EmailAuthProvider()]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (_) => sl<AuthenticationBloc>(),
        ),
        BlocProvider<InternetCubit>(
          create: (_) => sl<InternetCubit>(),
        )
      ],
      child: MaterialApp(
        title: 'Bhutan Hub',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        darkTheme: BHAppTheme.darkTheme,
        theme: BHAppTheme.lightTheme,
        builder: EasyLoading.init(),
        onGenerateRoute: generateRoute,
        // home: const BottomMenu(),
      ),
    );
  }
}
