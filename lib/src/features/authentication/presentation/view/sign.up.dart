import 'package:bhutanhub/core/common/custom/auth.container.dart';
import 'package:bhutanhub/core/common/widgets/auth.header.dart';
import 'package:bhutanhub/core/common/widgets/auth.navigator.dart';
import 'package:bhutanhub/core/common/widgets/loader.dart';
import 'package:bhutanhub/core/constants/images.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/core/constants/texts.dart';
import 'package:bhutanhub/core/utils/loading.helper.dart';
import 'package:bhutanhub/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:bhutanhub/src/features/authentication/presentation/view/sign.in.dart';
import 'package:bhutanhub/src/features/authentication/presentation/widgets/_register.form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = '/sign-up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationLoading) {
            LoadingHelper.showLoading();
          } else if (state is AuthenticationSuccess) {
            LoadingHelper.dismissLoading();
            Loader.successSnackBar(
              title: BHTexts.successSnackTitle,
              message: BHTexts.successRegisterSnackBody,
            );
            Navigator.pushNamed(context, SignInView.routeName);
          } else if (state is AuthenticationError) {
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
                              title: BHTexts.authRegisterTitle,
                              image: BHImages.goggle,
                              height: BHSizes.logo3Xl,
                            ),
                            SizedBox(height: BHSizes.spaceSections * 1.5),

                            // --- Register form
                            RegisterForm(),
                            SizedBox(height: BHSizes.spaceSections),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // --- Register
                  AuthNavigator(
                    text: BHTexts.alreadyHaveAccount,
                    navigatorText: BHTexts.login,
                    routerName: SignInView.routeName,
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
