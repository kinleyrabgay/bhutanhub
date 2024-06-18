import 'package:bhutan_hub/core/common/widgets/product.price.text.dart';
import 'package:bhutan_hub/core/constants/colors.dart';
import 'package:bhutan_hub/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class BHProductPrice extends StatelessWidget {
  const BHProductPrice({
    super.key,
    required this.actualPrice,
    required this.percentOff,
    required this.discountedPrice,
  });

  final String actualPrice;
  final String percentOff;
  final String discountedPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BHProductPriceText(
          currencySign: '\$',
          price: actualPrice,
          maxLines: 1,
          isLarge: false,
          lineThrough: true,
          textColor: BHColors.primary,
        ),
        const SizedBox(width: BHSizes.pSm),
        Container(
          color: BHColors.primary,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  '-$percentOff%',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .apply(color: BHColors.white),
                ),
                const SizedBox(width: BHSizes.pSm),
                BHProductPriceText(
                  currencySign: '\$',
                  price: discountedPrice,
                  maxLines: 1,
                  isLarge: false,
                  lineThrough: false,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
