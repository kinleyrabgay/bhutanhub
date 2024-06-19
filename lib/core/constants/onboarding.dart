// lib/core/constants/onboarding_constants.dart

import 'images.dart';
import 'texts.dart';

class OnboardingContent {
  final String image;
  final String title;
  final String subtitle;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

List<OnboardingContent> onboardingPages = [
  OnboardingContent(
    image: BHImages.obIM1,
    title: BHTexts.obT1,
    subtitle: BHTexts.obST1,
  ),
  OnboardingContent(
    image: BHImages.obIM2,
    title: BHTexts.obT2,
    subtitle: BHTexts.obST2,
  ),
  OnboardingContent(
    image: BHImages.obIM3,
    title: BHTexts.obT3,
    subtitle: BHTexts.obST3,
  ),
  OnboardingContent(
    image: BHImages.obIM4,
    title: BHTexts.obT4,
    subtitle: BHTexts.obST4,
  ),
  OnboardingContent(
    image: BHImages.obIM5,
    title: BHTexts.obT5,
    subtitle: BHTexts.obST5,
  ),
];
