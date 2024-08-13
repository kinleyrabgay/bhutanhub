import 'package:bhutanhub/core/common/entities/product.entity.dart';
import 'package:bhutanhub/core/common/widgets/circular.image.dart';
import 'package:bhutanhub/core/common/widgets/product.price.tag.dart';
import 'package:bhutanhub/core/common/widgets/product.title.dart';
import 'package:bhutanhub/core/common/widgets/shimmer.dart';
import 'package:bhutanhub/core/constants/colors.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class BHProductCardVertical extends StatelessWidget {
  const BHProductCardVertical({
    super.key,
    required this.product,
    this.isLoading = false,
  });

  final ProductEntity product;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              if (isLoading) ...[
                const BHShimmerEffect(
                  width: double.infinity,
                  height: 250,
                  radius: 2,
                ),
              ] else ...[
                BHCircularImage(
                  image: product.image[0],
                  width: double.infinity,
                  height: 250,
                  borderRadius: 2,
                  border: 2,
                  isNetworkImage: true,
                  applyImageRadius: true,
                  padding: 0,
                  fit: BoxFit.cover,
                ),
              ],
              if (product.discount! > 0) ...[
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: BHColors.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '${product.discount}%',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .apply(color: BHColors.white),
                      ),
                    ),
                  ),
                )
              ]
            ],
          ),
          const SizedBox(height: BHSizes.spaceItems / 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (product.name.isNotEmpty) ...[
                BHProductTitleText(
                  title: product.name,
                  smallSize: true,
                ),
              ] else ...[
                BHShimmerEffect(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 12,
                  radius: 4,
                ),
              ],
              const SizedBox(height: BHSizes.spaceItems / 4),
              if (product.price > 0) ...[
                BHProductPrice(
                  discountedPrice: product.discountedPrice!,
                  percentOff: product.discount!,
                  actualPrice: product.price,
                )
              ] else ...[
                BHShimmerEffect(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 10,
                  radius: 4,
                ),
              ]
            ],
          )
        ],
      ),
    );
  }
}
