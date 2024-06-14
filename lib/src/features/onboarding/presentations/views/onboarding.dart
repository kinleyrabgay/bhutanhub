import 'package:bhutan_hub/core/common/widgets/loading.dart';
import 'package:bhutan_hub/core/constants/images.dart';
import 'package:bhutan_hub/core/constants/texts.dart';
import 'package:bhutan_hub/src/features/onboarding/presentations/cubit/onboarding_cubit.dart';
import 'package:bhutan_hub/src/features/onboarding/presentations/widgets/_navigation.dart';
import 'package:bhutan_hub/src/features/onboarding/presentations/widgets/_next.button.dart';
import 'package:bhutan_hub/src/features/onboarding/presentations/widgets/_page.dart';
import 'package:bhutan_hub/src/features/onboarding/presentations/widgets/_skip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    return Scaffold(
      body: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingStatus && !state.isFirstTimer) {
            Navigator.pushReplacementNamed(context, '/');
          } else if (state is UserCached) {
            Navigator.pushReplacementNamed(context, '/sign-in');
          }
        },
        builder: (context, state) {
          if (state is CheckingIfUserIsFirstTimer) {
            return const LoadingView();
          }

          return Stack(
            children: [
              PageView(
                controller: cubit.pageController,
                onPageChanged: (index) => cubit.updatePageIndicator(index),
                children: const [
                  OnboardingPage(
                    image: BHImages.goggle,
                    title: BHTexts.onBoardingTitle1,
                    subtitle: BHTexts.onBoardingSubTitle1,
                  ),
                  OnboardingPage(
                    image: BHImages.goggle,
                    title: BHTexts.onBoardingTitle2,
                    subtitle: BHTexts.onBoardingSubTitle2,
                  ),
                  OnboardingPage(
                    image: BHImages.goggle,
                    title: BHTexts.onBoardingTitle3,
                    subtitle: BHTexts.onBoardingSubTitle3,
                  ),
                ],
              ),
              const OnboardingSkip(),
              const OnboardingDotNavigation(),
              const OnboardingNextButton(),
            ],
          );
        },
      ),
    );
  }
}
