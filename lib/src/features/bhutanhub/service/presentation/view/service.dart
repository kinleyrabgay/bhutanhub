import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class ServiceView extends StatelessWidget {
  const ServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: BHSizes.appBarHeight,
          left: BHSizes.defaultSpace,
          right: BHSizes.defaultSpace,
        ),
        child: Column(
          children: [Text("Hello from service listing")],
        ),
      ),
    );
  }
}
