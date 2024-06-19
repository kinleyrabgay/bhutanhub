import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/core/utils/helpers/helper.function.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(BHSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: BHHelperFunctions.screenWidth(context) * 0.8,
            height: BHHelperFunctions.screenHeight(context) * 0.6,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: BHSizes.spaceItems),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
