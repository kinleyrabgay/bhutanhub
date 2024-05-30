import 'package:bhutan_hub/core/common/widgets/title.text.dart';
import 'package:bhutan_hub/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.image,
    required this.title,
    required this.height,
  });

  final String image;
  final String title;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(image),
          height: height,
        ),
        const SizedBox(height: BHSizes.spaceItems * 1.5),
        TitleText(text: title),
      ],
    );
  }
}
