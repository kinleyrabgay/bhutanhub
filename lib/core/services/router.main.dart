part of 'router.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      final prefs = sl<SharedPreferences>();
      return _pageBuilder(
        (context) {
          if (prefs.getBool(ConstantKeys.cacheKey) ?? true) {
            return BlocProvider(
              create: (_) => sl<OnboardingCubit>(),
              child: const OnboardingView(),
            );
          } else if (sl<FirebaseAuth>().currentUser != null) {
            final user = sl<FirebaseAuth>().currentUser!;
            final localUser = UserModel(
              uid: user.uid,
              avatar: user.photoURL ?? '',
              name: user.displayName ?? '',
              email: user.email ?? '',
            );
            //  context.userProvider.initUser(localUser);
            return const BhutanhubNavigation();
          }
          return BlocProvider(
            create: (_) => sl<AuthenticationBloc>(),
            child: const SignInView(),
          );
        },
        settings: settings,
      );

    case BhutanhubNavigation.routeName:
      return _pageBuilder(
        (_) => const BhutanhubNavigation(),
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

    case AddressView.routeName:
      return _pageBuilder(
        (_) => const AddressView(),
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
