import 'package:bhutanhub/core/common/widgets/gradient_background.dart';
import 'package:bhutanhub/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageUnderConstruction extends StatelessWidget {
  const PageUnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GradientBackground(
        image: BHImages.aution,
        child: Center(
          child: Lottie.asset(
            BHImages.pageUnderConstruction,
          ),
        ),
      ),
    );
  }
}
