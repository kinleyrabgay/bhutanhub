import 'package:bhutan_hub/core/common/widgets/product.price.tag.dart';
import 'package:bhutan_hub/core/common/widgets/product.title.dart';
import 'package:bhutan_hub/core/common/widgets/rounded.container.dart';
import 'package:bhutan_hub/core/common/widgets/rounded.image.dart';
import 'package:bhutan_hub/core/constants/colors.dart';
import 'package:bhutan_hub/core/constants/images.dart';
import 'package:bhutan_hub/core/constants/sizes.dart';
import 'package:bhutan_hub/core/utils/helpers/helper.function.dart';
import 'package:flutter/material.dart';

class BHProductCardVertical extends StatelessWidget {
  const BHProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BHRoundedContainer(
            height: 250,
            backgroundColor: dark ? BHColors.dark : BHColors.light,
            child: BHRoundedImage(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 1.0,
              borderRadius: 0,
              imageUrl: BHImages.naruto,
              applyImageRadius: true,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: BHSizes.spaceItems / 2),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BHProductTitleText(
                title: 'NARUTO TEAM FIGURE',
                smallSize: true,
              ),
              SizedBox(height: BHSizes.spaceItems / 4),
              BHProductPrice(
                discountedPrice: '5639',
                percentOff: '8',
                actualPrice: '6130',
              )
            ],
          )
        ],
      ),
    );
  }
}
