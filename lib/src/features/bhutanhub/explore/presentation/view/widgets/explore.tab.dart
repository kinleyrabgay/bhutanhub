import 'package:bhutanhub/core/common/widgets/card.grid.dart';
import 'package:bhutanhub/core/common/widgets/product.card.vertical.dart';
import 'package:bhutanhub/core/common/widgets/section.heading.dart';
import 'package:flutter/material.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BHSectionHeading(
            showActionButton: true,
            title: 'Popular Products',
            onPressed: () => {},
          ),
          BHGridLayout(
            itemCount: 4,
            mainAxisExtent: 330,
            itemBuilder: (_, idx) {
              return const BHProductCardVertical();
            },
          ),
        ],
      ),
    );
  }
}
