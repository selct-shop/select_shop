import 'dart:async';

import 'package:flutter/material.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/helpers/cache_helper.dart';

// changeLocal()async {
// Locale appLocal = await CacheHelper.getData(key: 'local');
// // Locale appLocal = Locale('en');
// print(appLocal);

// }

// Future<Locale>
// getLocal() async {
// // Locale appLocal =
// //  if (await CacheHelper.getData(key: 'local') == null || await CacheHelper.getData(key: 'local') == "" ) {

// //    Locale('en');

// // }else {
// //     Locale(await CacheHelper.getData(key: 'local') );
// // };
// // // Locale appLocal = Locale('en');

// // print(appLocal);
// // return appLocal;

//   Locale initalLang =
//       CacheHelper.getData(key: 'lang') == 'en' ? Locale('en') : Locale('ar');

//   return initalLang;
//   // String emailVerLang() {
//   //   return CacheHelper.getData(key:'lang') == 'en' ? 'en' : 'ar';
//   // }
// }

cachLocal({required String langCode}) async {
  // Locale myLocale = Locale(langCode);

  // Get.updateLocale(myLocale);

  await CacheHelper.setData(key: AppConstants.cachedUserLang, value: langCode);

// RestartWidget.restartApp(context);
}
