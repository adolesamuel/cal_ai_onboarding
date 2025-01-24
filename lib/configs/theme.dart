import 'package:cal_ai/configs/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData theme() {
  return ThemeData(
    primarySwatch: Colors.grey,
    bottomSheetTheme: const BottomSheetThemeData(),
    primaryTextTheme: Typography().black,
    textTheme: Typography().black,
    scaffoldBackgroundColor: Colors.white,
    // fontFamily: FontFamily.plusJakartaSans,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
      filled: true,
      contentPadding: REdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      border: Constants.textFieldBorder,
      focusedBorder: Constants.textFieldBorder,
      enabledBorder: Constants.textFieldBorder,
      disabledBorder: Constants.textFieldBorder,
    ),
    iconButtonTheme: const IconButtonThemeData(style: ButtonStyle(enableFeedback: true)),
    //OutlinedButton
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        enableFeedback: true,
        // foregroundColor: WidgetStateProperty.resolveWith((states) => AppColors.white),
        // side: WidgetStateProperty.resolveWith(
        //     (states) => BorderSide(color: AppColors.outlinedButtonBorderColor, width: 3.0.r)),
        padding: WidgetStateProperty.resolveWith((states) => REdgeInsets.symmetric(horizontal: 24, vertical: 10)),
      ),
    ),
    // Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        enableFeedback: true,
        fixedSize: const Size(300, 60),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black87,
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
