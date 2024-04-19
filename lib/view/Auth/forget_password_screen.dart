// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:select_shop/core/constans/app_constants.dart';
import 'package:select_shop/core/constans/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/l10n/app_localizations.dart';
import 'package:select_shop/view/Auth/login_screen.dart';
import 'package:select_shop/view/Shared/app_button.dart';
import 'package:select_shop/view/Shared/app_text_form_field.dart';

TextStyle _customTitleTextStyle = TextStyle(
    color: AppColors.mainColor, fontWeight: FontWeight.bold, fontSize: 20);

TextEditingController _emailTextEditingContorller = TextEditingController();

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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(width: 160, AppImages.logo),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    style: _customTitleTextStyle,
                    AppLocalizations.of(context)!.resetPassword),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  style: TextStyle(
                    color: AppColors.mainGreyColor,
                    fontSize: 14,
                  ),
                  AppLocalizations.of(context)!.enterEmailToResetOne,
                ),
                Text(
                  style: TextStyle(
                    color: AppColors.mainGreyColor,
                    fontSize: 14,
                  ),
                  AppLocalizations.of(context)!.enterEmailToResetTwo,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  child: AppTextFormField(
                    controller: _emailTextEditingContorller,
                    onChanged: (p0) {},
                    validator: (p0) {},
                    shadow: true,
                    hintText: AppLocalizations.of(context)!.email,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AppButton(
                  title: AppLocalizations.of(context)!.sendCode,
                  textColor: Colors.white,
                  width: double.infinity,
                  backgroundColor: AppColors.mainColor,
                  onTap: () {
                    // validate
                    // contorller.resetpassword
                  },
                ),
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
                      AppLocalizations.of(context)!.backToSignIn,
                    )),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
