import 'package:bhutanhub/core/common/widgets/loading.dart';
import 'package:bhutanhub/core/constants/onboarding.dart';
import 'package:bhutanhub/src/features/onboarding/presentations/cubit/onboarding_cubit.dart';
import 'package:bhutanhub/src/features/onboarding/presentations/widgets/_navigation.dart';
import 'package:bhutanhub/src/features/onboarding/presentations/widgets/_next.button.dart';
import 'package:bhutanhub/src/features/onboarding/presentations/widgets/_page.dart';
import 'package:bhutanhub/src/features/onboarding/presentations/widgets/_skip.dart';
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
              PageView.builder(
                controller: cubit.pageController,
                onPageChanged: (index) => cubit.updatePageIndicator(index),
                itemCount: onboardingPages.length,
                itemBuilder: (context, index) {
                  final content = onboardingPages[index];
                  return OnboardingPage(
                    image: content.image,
                    title: content.title,
                    subtitle: content.subtitle,
                  );
                },
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
