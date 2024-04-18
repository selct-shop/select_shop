import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/view/Shared/app_button.dart';

class ChoseLanguageScreen extends StatelessWidget {
  const ChoseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppButton(
                title: "العربيه",
                width: double.infinity,
                hasBorder: true,
                backgroundColor: Localizations.localeOf(context) == Locale('en')
                    ? AppColors.mainColor
                    : Colors.white,
                textColor: Localizations.localeOf(context) == Locale('en')
                    ? Colors.white
                    : AppColors.mainColor,
                onTap: () {
                  // set app language
                  // then navigate to logIn screen
                },
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                title: "English",
                width: double.infinity,
                hasBorder: true,
                backgroundColor: Localizations.localeOf(context) == Locale('ar')
                    ? AppColors.mainColor
                    : Colors.white,
                textColor: Localizations.localeOf(context) == Locale('ar')
                    ? Colors.white
                    : AppColors.mainColor,
                onTap: () {
                  // set app language
                  // then navigate to logIn screen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
