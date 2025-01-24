import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData theme() {
  return ThemeData(
    primarySwatch: Colors.grey,
    bottomSheetTheme: const BottomSheetThemeData(),
    primaryTextTheme: Typography().white,
    textTheme: Typography().white,
    // fontFamily: FontFamily.plusJakartaSans,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
      filled: true,
      // fillColor: AppColors.textFieldFillColor,
      contentPadding: REdgeInsets.symmetric(horizontal: 40, vertical: 20),
      // border: Constants.textFieldBorder,
      // focusedBorder: Constants.textFieldBorder,
      // enabledBorder: Constants.textFieldBorder,
      // disabledBorder: Constants.textFieldBorder,
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
    //Elevated Button
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ButtonStyle(
    //   enableFeedback: true,
    //   backgroundColor: WidgetStateProperty.resolveWith((states) {
    //     if (states.contains(WidgetState.pressed)) {
    //       return AppColors.buttonBackground.withOpacity(0.5);
    //     }
    //     return AppColors.buttonBackground;
    //   }),
    //   foregroundColor: WidgetStateProperty.resolveWith((states) => AppColors.white),
    // )),
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: AppColors.navBarBGColor,
    // )
    // MaterialColor(
    //   0xFF000000,
    //   {
    //     50: Color.fromRGBO(72, 162, 214, .1),
    //     100: Color.fromRGBO(72, 162, 214, .2),
    //     200: Color.fromRGBO(72, 162, 214, .3),
    //     300: Color.fromRGBO(72, 162, 214, .4),
    //     400: Color.fromRGBO(72, 162, 214, .5),
    //     500: Color.fromRGBO(72, 162, 214, .6),
    //     600: Color.fromRGBO(72, 162, 214, .7),
    //     700: Color.fromRGBO(72, 162, 214, .8),
    //     800: Color.fromRGBO(72, 162, 214, .9),
    //     900: Color.fromRGBO(72, 162, 214, 1),
    //   },
    // ),
  );
}
