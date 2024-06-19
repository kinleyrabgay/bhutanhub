import 'package:bhutanhub/core/common/custom/curve.edge.dart';
import 'package:flutter/material.dart';

class CurveEdgesWidget extends StatelessWidget {
  const CurveEdgesWidget({
    super.key,
    this.child,
    this.curve = false,
  });

  final Widget? child;
  final bool curve;

  @override
  Widget build(BuildContext context) {
    if (curve) {
      return ClipPath(
        clipper: BHCustomCurvedEdges(),
        child: child,
      );
    } else {
      return child ?? const SizedBox.shrink();
    }
  }
}
