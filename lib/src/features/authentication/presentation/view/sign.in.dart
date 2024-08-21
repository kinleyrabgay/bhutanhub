import 'package:bhutanhub/core/providers/user.provider.dart';
import 'package:bhutanhub/core/utils/loading.helper.dart';
import 'package:bhutanhub/src/features/bhutanhub/bhutanhub.navigation.dart';
import 'package:bhutanhub/core/common/custom/auth.container.dart';
import 'package:bhutanhub/core/common/widgets/auth.header.dart';
import 'package:bhutanhub/core/common/widgets/auth.navigator.dart';
import 'package:bhutanhub/core/common/widgets/divider.dart';
import 'package:bhutanhub/core/common/widgets/loader.dart';
import 'package:bhutanhub/core/constants/images.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/core/constants/texts.dart';
import 'package:bhutanhub/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:bhutanhub/src/features/authentication/presentation/view/sign.up.dart';
import 'package:bhutanhub/src/features/authentication/presentation/widgets/_login.form.dart';
import 'package:bhutanhub/src/features/authentication/presentation/widgets/_social.authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const routeName = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationLoading) {
            LoadingHelper.showLoading();
          } else if (state is Authenticated) {
            context.read<UserProvider>().initUser(state.user);
            LoadingHelper.dismissLoading();
            Loader.successSnackBar(
              title: BHTexts.successSnackTitle,
              message: BHTexts.successLoginSnackBody,
            );
            Navigator.pushNamed(context, BhutanhubNavigation.routeName);
          } else if (state is Error) {
            LoadingHelper.dismissLoading();
            Loader.errorSnackBar(
              title: BHTexts.errorSnackTitle,
              message: state.message,
            );
          }
        },
        builder: (context, state) {
          return const BHCustomContainer(
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(BHSizes.defaultSpace),
                        child: Column(
                          children: [
                            // --- Logo
                            AuthHeader(
                              title: BHTexts.authLoginTitle,
                              image: BHImages.goggle,
                              height: BHSizes.logo3Xl,
                            ),
                            SizedBox(height: BHSizes.spaceSections * 1.5),

                            // --- Login form
                            LoginForm(),
                            SizedBox(height: BHSizes.spaceSections),

                            // --- Divider
                            BHFormDivider(dividerText: BHTexts.orSignInWith),
                            SizedBox(height: BHSizes.spaceSections),

                            // ---- Social button
                            SocialLogin(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // --- Register
                  AuthNavigator(
                    text: BHTexts.dontHaveAccount,
                    navigatorText: BHTexts.register,
                    routerName: SignUpView.routeName,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
