import 'package:bhutanhub/core/constants/colors.dart';
import 'package:flutter/material.dart';

class BHSectionHeading extends StatelessWidget {
  const BHSectionHeading({
    super.key,
    this.textColor,
    required this.showActionButton,
    this.showActionIcon = false,
    this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String? title;
  final String? buttonTitle;
  final bool? showActionIcon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style:
              Theme.of(context).textTheme.titleMedium!.apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(
            onPressed: onPressed,
            child: Text(buttonTitle!),
          ),
        if (showActionIcon!)
          GestureDetector(
            onTap: onPressed,
            child: const Icon(
              Icons.close,
              color: BHColors.primary,
            ),
          )
      ],
    );
  }
}
