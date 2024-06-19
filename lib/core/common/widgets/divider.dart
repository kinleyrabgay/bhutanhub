import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/utils/helpers/helper.function.dart';
import 'package:flutter/material.dart';

class BHFormDivider extends StatelessWidget {
  const BHFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final isDark = BHHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: isDark ? BHColors.darkGrey : BHColors.grey,
            thickness: 0.5,
            // indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: isDark ? BHColors.darkGrey : BHColors.grey,
            thickness: 0.5,
            indent: 5,
            // endIndent: 60,
          ),
        ),
      ],
    );
  }
}
