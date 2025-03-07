import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/onboarding.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/core/utils/devices/device.utility.dart';
import 'package:bhutanhub/core/utils/helpers/helper.function.dart';
import 'package:bhutanhub/src/features/onboarding/presentations/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHHelperFunctions.isDarkMode(context);
    final onboardingCubit = context.read<OnboardingCubit>();

    return Positioned(
      bottom: BHDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: BHSizes.defaultSpace,
      child: SmoothPageIndicator(
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? BHColors.white : BHColors.dark,
          dotHeight: 6,
        ),
        controller: onboardingCubit.pageController,
        onDotClicked: onboardingCubit.dotNavigationClick,
        count: onboardingPages.length,
      ),
    );
  }
}
