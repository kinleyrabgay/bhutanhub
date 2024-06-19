import 'package:bhutanhub/core/constants/colors.dart';
import 'package:flutter/material.dart';

class BHChipTheme {
  BHChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: BHColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: BHColors.black),
    selectedColor: BHColors.black,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: BHColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: BHColors.darkerGrey,
    labelStyle: TextStyle(color: BHColors.white),
    selectedColor: BHColors.black,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: BHColors.white,
  );
}
