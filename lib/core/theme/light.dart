import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:select_shop/core/theme/colors.dart';

ThemeData customLightTheme = ThemeData(
  colorScheme:
      ColorScheme.fromSwatch().copyWith(primary: AppColors.yellowColor),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.yellowColor,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: AppColors.bgColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: AppColors.blackColor,
      // fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.5,
      fontFamily: 'Cairo',
    ),
    iconTheme: IconThemeData(
        // color: AppColors.greyColor,
        color: AppColors.mainGreyColor
        // size: 25.sp,
        ),
  ),
  // scaffoldBackgroundColor: AppColors.bgColor,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Cairo',
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.yellowColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: AppColors.yellowColor,
    unselectedItemColor: Colors.black45,
    selectedIconTheme: IconThemeData(
        // size: 24.sp
        ),
    selectedLabelStyle: TextStyle(
      fontFamily: 'Cairo',
      // fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: TextStyle(
      // fontSize: 10.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'Cairo',
    ),
  ),
);
