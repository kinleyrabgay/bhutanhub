import 'package:bhutanhub/core/constants/colors.dart';
import 'package:flutter/material.dart';

class BHSectionHeading extends StatelessWidget {
  const BHSectionHeading({
    super.key,
    this.textColor,
    required this.showActionButton,
    this.showCloseAction = false,
    this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
    this.showMoreAction = false,
  });

  final Color? textColor;
  final bool showActionButton;
  final String? title;
  final String? buttonTitle;
  final bool? showCloseAction;
  final bool? showMoreAction;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: Theme.of(context).textTheme.titleMedium!.apply(
                color: textColor,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(
            onPressed: onPressed,
            // style: TextButton.styleFrom(
            //   padding: const EdgeInsets.all(BHSizes.pSm),
            //   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //   minimumSize: const Size(10, 10),
            // ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              child: Text(
                buttonTitle!,
                style: Theme.of(context).textTheme.labelSmall!.apply(
                    color:
                        ColorScheme.fromSeed(seedColor: Colors.blue).primary),
              ),
            ),
          ),
        if (showCloseAction!)
          GestureDetector(
            onTap: onPressed,
            child: const Icon(
              Icons.close,
              color: BHColors.primary,
            ),
          ),
        if (showMoreAction!)
          GestureDetector(
            onTap: onPressed,
            child: Text(
              'View all',
              style: Theme.of(context).textTheme.labelLarge!.apply(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    heightFactor: 0.2,
                  ),
            ),
          ),
      ],
    );
  }
}
