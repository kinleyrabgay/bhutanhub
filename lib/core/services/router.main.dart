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
          } else if (prefs.getString(StoreKey.token)?.isNotEmpty ?? false) {
            // Get the token
            final token = prefs.getString(StoreKey.token)!;

            // Get the token and fetch current user
            BlocProvider.of<AuthenticationBloc>(context).add(
              GetCurrentUserEvent(token: token),
            );
            // return const BhutanhubNavigation();
          }
          // else if (sl<FirebaseAuth>().currentUser != null) {
          //   final user = sl<FirebaseAuth>().currentUser!;
          //   print(user);
          //   final entity = UserEntity(
          //     uid: user.uid,
          //     name: user.displayName ?? '',
          //     avatar: user.photoURL ?? '',
          //     email: user.email ?? '',
          //   );
          //   // Initialize the user provider with the user data
          //   context.read<UserProvider>().initUser(entity);
          //   return const BhutanhubNavigation();
          // }
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

    case AboutUsView.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<PersonalizationBloc>(),
          child: const AboutUsView(),
        ),
        settings: settings,
      );

    case HelpCenterView.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<PersonalizationBloc>(),
          child: const HelpCenterView(),
        ),
        settings: settings,
      );

    case FeedbackView.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<PersonalizationBloc>(),
          child: const FeedbackView(),
        ),
        settings: settings,
      );

    case AddressView.routeName:
      return _pageBuilder(
        (_) => const AddressView(),
        settings: settings,
      );

    case CoverFlowCarouselPage.routeName:
      return _pageBuilder(
        (_) => const CoverFlowCarouselPage(),
        settings: settings,
      );

    case ProductsView.routeName:
      return _pageBuilder(
        (_) => const ProductsView(),
        settings: settings,
      );

    case Populars.routeName:
      return _pageBuilder(
        (_) => const Populars(),
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
