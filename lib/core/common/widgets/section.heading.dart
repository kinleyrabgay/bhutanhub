import 'package:flutter/material.dart';

class BHSectionHeading extends StatelessWidget {
  const BHSectionHeading({
    super.key,
    this.textColor,
    required this.showActionButton,
    this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String? title;
  final String? buttonTitle;
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
          )
      ],
    );
  }
}
