import 'package:bhutanhub/core/common/widgets/product.price.text.dart';
import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/currency.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class BHProductPrice extends StatelessWidget {
  const BHProductPrice({
    super.key,
    required this.actualPrice,
    required this.percentOff,
    required this.discountedPrice,
  });

  final double actualPrice;
  final double percentOff;
  final double discountedPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BHProductPriceText(
          currencySign: Currency.ngultrum,
          price: actualPrice,
          maxLines: 1,
          isLarge: false,
          lineThrough: percentOff > 0 ? true : false,
          textColor: BHColors.primary,
        ),
        const SizedBox(width: BHSizes.pSm),
        if (percentOff > 0) ...[
          Container(
            decoration: BoxDecoration(
              color: BHColors.primary,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: BHProductPriceText(
                currencySign: Currency.ngultrum,
                price: discountedPrice,
                maxLines: 1,
                isLarge: false,
                lineThrough: false,
              ),
            ),
          )
        ]
      ],
    );
  }
}
