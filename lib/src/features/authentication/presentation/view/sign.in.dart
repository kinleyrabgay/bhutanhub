import 'package:bhutan_hub/core/common/custom/auth.container.dart';
import 'package:bhutan_hub/core/common/widgets/auth.header.dart';
import 'package:bhutan_hub/core/common/widgets/auth.navigator.dart';
import 'package:bhutan_hub/core/common/widgets/divider.dart';
import 'package:bhutan_hub/core/constants/images.dart';
import 'package:bhutan_hub/core/constants/sizes.dart';
import 'package:bhutan_hub/core/constants/texts.dart';
import 'package:bhutan_hub/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:bhutan_hub/src/features/authentication/presentation/view/sign.up.dart';
import 'package:bhutan_hub/src/features/authentication/presentation/widgets/_login.form.dart';
import 'package:bhutan_hub/src/features/authentication/presentation/widgets/_social.authentication.dart';
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
          if (state is AuthenticationSuccess) {}
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
