// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:select_shop/core/constans/app_constants.dart';
import 'package:select_shop/core/constans/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/view/Auth/login_screen.dart';

TextStyle _customTitleTextStyle = TextStyle(
    color: AppColors.mainColor, fontWeight: FontWeight.bold, fontSize: 20);

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: SizedBox(
          width: double.infinity,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(width: 160, AppImages.logo),
              const SizedBox(
                height: 20,
              ),
              Text(style: _customTitleTextStyle, 'إعادة تعيين كلمة المرور'),
              const SizedBox(
                height: 20,
              ),
              Text(
                  style: TextStyle(
                    color: AppColors.mainGreyColor,
                    fontSize: 14,
                  ),
                  "أدخل بريدك الإلكتروني لإعادة تعيين"),
              Text(
                  style: TextStyle(
                    color: AppColors.mainGreyColor,
                    fontSize: 14,
                  ),
                  "كلمة المرور الخاصة بك"),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    navigateToWithReplacement(context, const LogInScreen());
                  },
                  child: Text(
                      style: _customTitleTextStyle.copyWith(
                        color: AppColors.mainGreyColor,
                        fontSize: 14,
                      ),
                      'العودة إلى تسجيل الدخول')),
            ],
          ),
        )),
      ),
    );
  }
}
