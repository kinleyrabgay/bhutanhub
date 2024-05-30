import 'package:bhutan_hub/core/common/custom/curve.edge.widget.dart';
import 'package:bhutan_hub/core/common/widgets/circular.container.dart';
import 'package:bhutan_hub/core/constants/colors.dart';
import 'package:flutter/material.dart';

class BHCustomContainer extends StatelessWidget {
  const BHCustomContainer({
    super.key,
    required this.child,
    this.background,
  });

  final Widget child;
  final bool? background;

  @override
  Widget build(BuildContext context) {
    return CurveEdgesWidget(
      child: Container(
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: BHCircularContainer(
                backgroundColor: BHColors.textPrimary.withOpacity(0.1),
                radius: 400,
              ),
            ),
            Positioned(
              top: 84,
              right: 350,
              child: BHCircularContainer(
                backgroundColor: BHColors.textPrimary.withOpacity(0.1),
                radius: 400,
                width: 20,
                height: 20,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
