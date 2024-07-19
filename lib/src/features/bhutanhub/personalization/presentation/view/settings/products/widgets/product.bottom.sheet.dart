import 'package:bhutanhub/core/common/widgets/section.heading.dart';
import 'package:bhutanhub/core/constants/sizes.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/presentation/view/settings/products/widgets/product.add.dart';
import 'package:flutter/material.dart';

Future<dynamic> bottomSheetModal(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        maxChildSize: 0.9,
        initialChildSize: 0.9,
        builder: (
          BuildContext context,
          ScrollController scrollController,
        ) {
          return Padding(
            padding: const EdgeInsets.all(BHSizes.pMd),
            child: Column(
              children: [
                BHSectionHeading(
                  showActionIcon: true,
                  showActionButton: false,
                  title: 'Add Product',
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(height: BHSizes.spaceSections / 2),
                SingleChildScrollView(
                  controller: scrollController,
                  child: const AddProduct(),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
