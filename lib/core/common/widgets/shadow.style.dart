import 'package:bhutanhub/core/constants/colors.dart';
import 'package:flutter/material.dart';

class BHShadowStyle {
  static final verticalItemShadow = BoxShadow(
    color: BHColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalItemShadow = BoxShadow(
    color: BHColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
