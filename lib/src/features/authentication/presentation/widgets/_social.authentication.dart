import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/images.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => context.read<AuthenticationBloc>().add(
                  SignInWithGoogleEvent(),
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  width: BHSizes.iconMd,
                  height: BHSizes.iconMd,
                  image: AssetImage(BHImages.goggle),
                ),
                const SizedBox(width: BHSizes.spaceItems),
                Text(
                  'Continue with Google',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: BHColors.black),
                ),
              ],
            ),
          ),
        ),
        // const SizedBox(height: BHSizes.spaceItems),
        // SizedBox(
        //   width: double.infinity,
        //   child: OutlinedButton(
        //     onPressed: () => controller.facebookSignIn(),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         const Image(
        //           width: BHSizes.iconMd,
        //           height: BHSizes.iconMd,
        //           image: AssetImage(BHImages.facebook),
        //         ),
        //         const SizedBox(width: BHSizes.spaceItems),
        //         Text(
        //           'Continue with Facebook',
        //           style: Theme.of(context)
        //               .textTheme
        //               .bodyLarge!
        //               .apply(color: BHColors.black),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
