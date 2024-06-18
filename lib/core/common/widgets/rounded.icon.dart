import 'package:bhutan_hub/core/constants/colors.dart';
import 'package:bhutan_hub/core/constants/sizes.dart';
import 'package:bhutan_hub/core/utils/helpers/helper.function.dart';
import 'package:flutter/material.dart';

class BHCircularIcon extends StatelessWidget {
  const BHCircularIcon({
    super.key,
    this.witdh,
    this.height,
    this.size = BHSizes.brLg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? witdh, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: witdh,
      height: height,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : BHHelperFunctions.isDarkMode(context)
                ? BHColors.black.withOpacity(0.9)
                : BHColors.white.withOpacity(0.9),
      ),
      child: IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
