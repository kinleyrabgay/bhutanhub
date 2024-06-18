import 'package:bhutan_hub/core/common/widgets/card.grid.dart';
import 'package:bhutan_hub/core/common/widgets/custom.app.bar.dart';
import 'package:bhutan_hub/core/common/widgets/product.card.vertical.dart';
import 'package:bhutan_hub/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class SellView extends StatelessWidget {
  const SellView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'What are you selling today?',
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
