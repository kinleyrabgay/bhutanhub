import 'package:bhutan_hub/core/common/widgets/product.price.text.dart';
import 'package:bhutan_hub/core/common/widgets/product.title.dart';
import 'package:bhutan_hub/core/common/widgets/rounded.container.dart';
import 'package:bhutan_hub/core/common/widgets/rounded.icon.dart';
import 'package:bhutan_hub/core/common/widgets/rounded.image.dart';
import 'package:bhutan_hub/core/common/widgets/shadow.style.dart';
import 'package:bhutan_hub/core/constants/colors.dart';
import 'package:bhutan_hub/core/constants/images.dart';
import 'package:bhutan_hub/core/constants/sizes.dart';
import 'package:bhutan_hub/core/utils/helpers/helper.function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BHProductCardVertical extends StatelessWidget {
  const BHProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => {},
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          boxShadow: [BHShadowStyle.verticalItemShadow],
          borderRadius: BorderRadius.circular(BHSizes.pLg),
          color: dark ? BHColors.darkerGrey : BHColors.white,
        ),
        child: Column(
          children: [
            BHRoundedContainer(
              height: 150,
              backgroundColor: dark ? BHColors.dark : BHColors.light,
              child: Stack(
                children: [
                  // Thumbnail
                  BHRoundedImage(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 1.0,
                    imageUrl: BHImages.facebook,
                    applyImageRadius: true,
                    fit: BoxFit.cover,
                  ),

                  // Sale Tag
                  Positioned(
                    top: 8,
                    left: 4,
                    child: BHRoundedContainer(
                      radius: BHSizes.pSm,
                      backgroundColor: BHColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: BHSizes.pSm,
                        vertical: BHSizes.pXs,
                      ),
                      child: Text(
                        '25 %',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: BHColors.black),
                      ),
                    ),
                  ),

                  //
                  const Positioned(
                    top: 4,
                    right: 4,
                    child: BHCircularIcon(
                      icon: CupertinoIcons.heart_fill,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: BHSizes.spaceItems / 2),
            const Padding(
              padding: EdgeInsets.only(left: BHSizes.pSm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BHProductTitleText(
                    title: 'Nike Air Shoe',
                    smallSize: true,
                  ),
                  SizedBox(height: BHSizes.spaceItems / 2),
                  // TBrandTitleWithVerficationIcon(title: 'Nike')
                  // const SizedBox(height: BHSizes.spaceBtwItems / 2),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: BHSizes.pSm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Price
                  const BHProductPriceText(
                    currencySign: '\$',
                    price: '35',
                    maxLines: 1,
                    isLarge: true,
                    lineThrough: false,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: BHColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(BHSizes.crMd),
                        bottomRight: Radius.circular(BHSizes.pXl),
                      ),
                    ),
                    child: const SizedBox(
                      width: BHSizes.iconLg * 1.2,
                      height: BHSizes.iconLg * 1.2,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
