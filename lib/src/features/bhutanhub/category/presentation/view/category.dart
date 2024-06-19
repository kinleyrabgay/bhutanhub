import 'package:bhutanhub/core/common/widgets/card.grid.dart';
import 'package:bhutanhub/core/common/widgets/product.card.vertical.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Category',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: BHSizes.defaultSpace),
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
