import 'package:bhutan_hub/core/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class BHGridLayout extends StatelessWidget {
  const BHGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent,
    required this.itemBuilder,
    this.crossAxisCount = 2,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final int crossAxisCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: mainAxisExtent,
        mainAxisSpacing: BHSizes.gridViewSpacing,
        crossAxisSpacing: BHSizes.gridViewSpacing,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
