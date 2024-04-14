import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:special_line_rider/generated/l10n.dart';
import 'package:special_line_rider/shared/theme/colors.dart';
import 'package:special_line_rider/shared/theme/styles.dart';

class SpinkitHelper {
  static var spinkit = SpinKitRotatingCircle(
    color: AppColors.yellowColor,
    size: 50.r,
  );
  static var fadinCube = SpinKitFadingCube(
    color: AppColors.yellowColor,
    size: 50.r,
  );
  static var pouringHourGlass = SpinKitPouringHourGlass(
    color: AppColors.yellowColor,
    size: 50.r,
  );
  static showLoadingProgress(context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            fadinCube,
            SizedBox(
              height: 20.h,
            ),
            Text(
              S.of(context).loading_please_wait,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
