import 'package:bhutanhub/core/common/widgets/card.grid.dart';
import 'package:bhutanhub/core/common/widgets/custom.app.bar.dart';
import 'package:bhutanhub/core/common/widgets/product.card.vertical.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Wishlist',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BHSizes.defaultSpace),
          child: BHGridLayout(
            itemCount: 8,
            mainAxisExtent: 330,
            itemBuilder: (_, idx) {
              return const BHProductCardVertical();
            },
          ),
        ),
      ),
    );
  }
}
