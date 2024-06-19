import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/utils/helpers/helper.function.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BHShimmerEffect extends StatelessWidget {
  const BHShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = BHHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? BHColors.darkerGrey : BHColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
