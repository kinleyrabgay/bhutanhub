import 'package:bhutan_hub/core/common/custom/auth.container.dart';
import 'package:bhutan_hub/core/common/widgets/auth.header.dart';
import 'package:bhutan_hub/core/common/widgets/divider.dart';
import 'package:bhutan_hub/core/constants/images.dart';
import 'package:bhutan_hub/core/constants/sizes.dart';
import 'package:bhutan_hub/core/constants/texts.dart';
import 'package:bhutan_hub/src/features/authentication/presentation/widgets/_login.form.dart';
import 'package:bhutan_hub/src/features/authentication/presentation/widgets/_social.authentication.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const routeName = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BHCustomContainer(
        child: SafeArea(
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
                  SizedBox(height: BHSizes.spaceSections * 2),

                  // --- Login form
                  LoginForm(),
                  SizedBox(height: BHSizes.spaceSections),

                  // --- Divier
                  BHFormDivider(divierText: BHTexts.orSignInWith),
                  SizedBox(height: BHSizes.spaceSections),

                  // ---- Social button
                  SocialLogin()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
