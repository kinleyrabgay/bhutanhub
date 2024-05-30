import 'package:flutter/material.dart';

class BHCircularContainer extends StatelessWidget {
  const BHCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    required this.radius,
    this.padding = 0,
    this.child,
    required this.backgroundColor,
    this.margin,
  });

  final double? width, height;
  final double radius;
  final double? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
