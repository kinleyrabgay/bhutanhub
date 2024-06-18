import 'package:bhutan_hub/core/common/custom/curve.edge.widget.dart';
import 'package:bhutan_hub/core/common/widgets/circular.container.dart';
import 'package:bhutan_hub/core/constants/colors.dart';
import 'package:flutter/material.dart';

class BHPrimaryHeaderContainer extends StatelessWidget {
  const BHPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurveEdgesWidget(
      child: Container(
        color: BHColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: BHCircularContainer(
                backgroundColor: BHColors.textWhite.withOpacity(0.1),
                radius: 400,
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: BHCircularContainer(
                backgroundColor: BHColors.textWhite.withOpacity(0.1),
                radius: 400,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
