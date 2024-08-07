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
        builder: (BuildContext context, ScrollController scrollController) {
          return const AddProduct();
        },
      );
    },
  );
}
