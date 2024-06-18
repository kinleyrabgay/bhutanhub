import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bhutan_hub/core/constants/colors.dart';
import 'package:bhutan_hub/core/utils/theme/custom/app.bar.dart';
import 'package:bhutan_hub/core/utils/theme/custom/bottom.sheet.dart';
import 'package:bhutan_hub/core/utils/theme/custom/checkbox.dart';
import 'package:bhutan_hub/core/utils/theme/custom/chip.dart';
import 'package:bhutan_hub/core/utils/theme/custom/elevated.button.dart';
import 'package:bhutan_hub/core/utils/theme/custom/outlined.button.dart';
import 'package:bhutan_hub/core/utils/theme/custom/text.field.dart';
import 'package:bhutan_hub/core/utils/theme/custom/text.theme.dart';

class BHAppTheme {
  const BHAppTheme._();

  // Method to set the status bar icon color
  static void setStatusBarStyle({bool isDarkMode = false}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
      statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDarkMode ? Brightness.dark : Brightness.light,
    ));
  }

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: BHTextTheme.lightTextTheme,
    chipTheme: BHChipTheme.lightChipTheme,
    scaffoldBackgroundColor: BHColors.appBG,
    appBarTheme: BHAppBarTheme.lightAppBarTheme,
    checkboxTheme: BHCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: BHBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: BHElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: BHOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: BHTextFieldTheme.lightInputDecorationTheme,
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: BHTextTheme.darkTextTheme,
    chipTheme: BHChipTheme.darkChipTheme,
    scaffoldBackgroundColor: BHColors.dark,
    appBarTheme: BHAppBarTheme.darkAppBarTheme,
    checkboxTheme: BHCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: BHBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: BHElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: BHOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: BHTextFieldTheme.darkInputDecorationTheme,
  );
}
