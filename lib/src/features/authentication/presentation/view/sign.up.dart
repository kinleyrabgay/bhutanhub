import 'package:bhutan_hub/core/common/custom/auth.container.dart';
import 'package:bhutan_hub/core/common/widgets/auth.header.dart';
import 'package:bhutan_hub/core/common/widgets/auth.navigator.dart';
import 'package:bhutan_hub/core/constants/images.dart';
import 'package:bhutan_hub/core/constants/sizes.dart';
import 'package:bhutan_hub/core/constants/texts.dart';
import 'package:bhutan_hub/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:bhutan_hub/src/features/authentication/presentation/view/sign.in.dart';
import 'package:bhutan_hub/src/features/authentication/presentation/widgets/_register.form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = '/sign-up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationSuccess) {
            EasyLoading.dismiss();
            Navigator.pushNamed(context, SignInView.routeName);
          } else if (state is AuthenticationError) {}
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
