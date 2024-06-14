import 'package:bhutan_hub/core/constants/colors.dart';
import 'package:bhutan_hub/core/constants/sizes.dart';
import 'package:bhutan_hub/core/utils/devices/device.utility.dart';
import 'package:bhutan_hub/core/utils/helpers/helper.function.dart';
import 'package:bhutan_hub/src/features/onboarding/presentations/cubit/onboarding_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHHelperFunctions.isDarkMode(context);
    final onboardingCubit = context.read<OnboardingCubit>();

    return Positioned(
      right: BHSizes.defaultSpace,
      bottom: BHDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () {
          onboardingCubit.nextPage();
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? BHColors.primary : BHColors.black,
        ),
        child: const Icon(
          CupertinoIcons.arrow_right,
          color: Colors.white,
        ),
      ),
    );
  }
}
