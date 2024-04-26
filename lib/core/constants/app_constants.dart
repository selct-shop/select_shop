import 'package:flutter/material.dart';
import 'package:select_shop/core/theme/colors.dart';

class AppConstants {
  static const double theDefBaddingTenPixl = 10;
  static const double theDefBaddingFifteenPixl = 15;
  static const double emptySpaceFivePixl = 5;
  // static const double emptySpaceTenPixl = 10;

  // TextStyle
  static TextStyle customTitleTextStyle = const TextStyle(
      color: AppColors.mainColor, fontWeight: FontWeight.bold, fontSize: 20);

  static const SizedBox emptySpaceTenPixl = SizedBox(
    width: 10,
    height: 10,
  );

// TextStyle _customTitleTextStyle = TextStyle(
// color: AppColors.mainColor, fontWeight: FontWeight.bold, fontSize: 20);

//
//

  static const String cachedUserName = "cachedUserName";
  static const String cachedUserEmail = "cachedUseremail";
  static const String cachedUserPhonNum = "cachedUserPhoNum";
  static const String cachedUserToken = "cachedUserToken";
}
