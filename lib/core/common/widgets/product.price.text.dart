import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/currency.dart';
import 'package:flutter/material.dart';

class BHProductPriceText extends StatelessWidget {
  const BHProductPriceText({
    super.key,
    this.currencySign = Currency.ngultrum,
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
    this.textColor = BHColors.white,
  });

  final String currencySign;
  final double price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$currencySign $price',
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.labelLarge!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null,
                color: textColor,
              )
          : Theme.of(context).textTheme.labelSmall!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null,
                color: textColor,
              ),
    );
  }
}
