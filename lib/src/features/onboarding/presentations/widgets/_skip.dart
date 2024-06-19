import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/core/utils/devices/device.utility.dart';
import 'package:bhutanhub/src/features/onboarding/presentations/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = context.read<OnboardingCubit>();

    return Positioned(
      top: BHDeviceUtils.getAppBarHeight(),
      right: BHSizes.defaultSpace,
      child: TextButton(
        onPressed: () {
          onboardingCubit.skipPage();
        },
        child: const Text('Skip'),
      ),
    );
  }
}
