import 'package:bhutanhub/core/common/entities/product.entity.dart';
import 'package:bhutanhub/core/common/widgets/card.grid.dart';
import 'package:bhutanhub/core/common/widgets/product.card.vertical.dart';
import 'package:bhutanhub/core/common/widgets/shimmer.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductLoader extends StatelessWidget {
  const ProductLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: BHSizes.spaceItems),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BHShimmerEffect(
              width: MediaQuery.of(context).size.width * 0.25,
              height: 15,
              radius: 4,
            ),
            BHShimmerEffect(
              width: MediaQuery.of(context).size.width * 0.1,
              height: 15,
              radius: 4,
            ),
          ],
        ),
        const SizedBox(height: BHSizes.spaceItems),
        BHGridLayout(
          itemCount: 4,
          mainAxisExtent: 330,
          itemBuilder: (_, idx) {
            return const BHProductCardVertical(
              product: ProductEntity.empty(),
              isLoading: true,
            );
          },
        ),
      ],
    );
  }
}
