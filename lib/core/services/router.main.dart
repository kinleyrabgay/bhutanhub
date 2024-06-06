part of 'router.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      final prefs = sl<SharedPreferences>();
      return _pageBuilder(
        (context) {
          // if (prefs.getBool(kFirstTimerKey) ?? true) {
          //   return BlocProvider(
          //     create: (_) => sl<OnBoardingCubit>(),
          //     child: const OnBoardingView(),
          //   );
          // } else if (sl<FirebaseAuth>().currentUser != null) {
          //   final user = sl<FirebaseAuth>().currentUser!;
          //   final localUser = LocalUserModel(
          //     uid: user.uid,
          //     email: user.email ?? '',
          //     points: 0,
          //     fullName: user.displayName ?? '',
          //   );
          //   context.userProvider.initUser(localUser);
          //   return const HomeView();
          // }
          if (prefs.getBool(Constant.cacheKey) ?? true) {
            // route on boarding
          } else if (sl<FirebaseAuth>().currentUser != null) {
            final user = sl<FirebaseAuth>().currentUser!;
            final localUser = UserModel(
              uid: user.uid,
              avatar: user.photoURL ?? '',
              name: user.displayName ?? '',
              email: user.email ?? '',
            );
            // route home
          }
          // return BlocProvider(
          //   create: (_) => sl<AuthenticationBloc>(),
          //   child: const SignInView(),
          // );
          return const NavigationMenu();
        },
        settings: settings,
      );

    case SignInView.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<AuthenticationBloc>(),
          child: const SignInView(),
        ),
        settings: settings,
      );

    case SignUpView.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<AuthenticationBloc>(),
          child: const SignUpView(),
        ),
        settings: settings,
      );

    case '/forgot-password':
      return _pageBuilder(
        (_) => const fui.ForgotPasswordScreen(),
        settings: settings,
      );
    default:
      return _pageBuilder(
        (_) => const PageUnderConstruction(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
