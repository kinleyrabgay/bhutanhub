import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/images.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(BHSizes.defaultSpace),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                BHImages.noInternet,
                height: 100,
              ),
              const SizedBox(height: BHSizes.spaceSections),
              Text(
                'We need internet connection to work properly, please turn on your internet connection and try again!',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: BHColors.primary),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
