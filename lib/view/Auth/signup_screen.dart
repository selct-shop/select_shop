import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/l10n/app_localizations.dart';
import 'package:select_shop/view/Shared/under_develop_screen.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/core/theme/light.dart';
import 'package:select_shop/view/Auth/login_screen.dart';
import 'package:select_shop/view/home/home_screen.dart';

part "widgets/signup_widgets.dart";

bool obscuringTextOrNot = true;
bool? _userAgreementChecked = false;
GlobalKey signUpKey = GlobalKey();
TextEditingController signUserNameTextEditingContorller =
    TextEditingController();
TextEditingController signUpserEmailTextEditingController =
    TextEditingController();
TextEditingController signUpPasswordTextEditingController =
    TextEditingController();
TextEditingController confirmSignupPassTexEdiController =
    TextEditingController();

TextStyle _customLocalTextStyle = TextStyle(
  color: AppColors.mainGreyColor,
);

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _AuthCustomIcon(
                size: size,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      style: const TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      S.of(context).signUp,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FormBuilder(
                        key: signUpKey,
                        child: Column(
                          children: [
                            const _UserNameFormFeild(),
                            const SizedBox(
                              height: 20,
                            ),
                            _UserEmailFormFeild(),
                            const SizedBox(
                              height: 20,
                            ),
                            _PasswordFormFeild(context),
                            const SizedBox(
                              height: 20,
                            ),
                            _ConfirmPasswordFormFeild(context),
                            const SizedBox(
                              height: 20,
                            ),
                            _UserAggrementRow(context),
                            const SizedBox(
                              height: 20,
                            ),
                            const _SignUpButton(),
                            const SizedBox(
                              height: 30,
                            ),
                            const _DoYouHaveAccount(),
                            const SizedBox(
                              height: 30,
                            ),
                            const _OrSignUpWithGoogle(),
                            const SizedBox(
                              height: 30,
                            ),
                            _GoogleIcons(),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _UserAggrementRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: AppColors.mainColor, // color of the border
          ),
          child: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            side: MaterialStateBorderSide.resolveWith(
              (states) => BorderSide(width: 1.0, color: AppColors.mainColor),
            ),
            activeColor: AppColors.mainColor,
            value: _userAgreementChecked,
            onChanged: (value) {
              _userAgreementChecked = value;

              setState(() {});
            },
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                S.of(context).userAgrement,
                textAlign: TextAlign.center,

                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                // softWrap: true,

                style: TextStyle(
                  color: AppColors.mainGreyColor,
                  fontSize: 12,
                ),
                // overflow: TextOverflow.visible,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _ConfirmPasswordFormFeild(BuildContext context) {
    return Container(
      // confirm password feild
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            50,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              offset: Offset(0.0, 2.0),
              blurRadius: 3.0,
            ),
          ],
          color: Colors.white),
      child: FormBuilderTextField(
        name: S.of(context).confirmNewPassword,
        style: _customLocalTextStyle,
        obscureText: obscuringTextOrNot,
        controller: confirmSignupPassTexEdiController,
        decoration: InputDecoration(
          hintText: S.of(context).confirmNewPassword,
          border: InputBorder.none,
          suffix: InkWell(
            child: obscuringTextOrNot == true
                ? FaIcon(
                    FontAwesomeIcons.eyeLowVision,
                    color: AppColors.mainGreyColor,
                  )
                : FaIcon(
                    FontAwesomeIcons.eye,
                    color: AppColors.mainGreyColor,
                  ),
            onTap: () {
              print("setttttttttttttttttttttttttttttttttttt");
              setState(() {
                obscuringTextOrNot == true
                    ? obscuringTextOrNot = false
                    : obscuringTextOrNot = true;
              });
            },
          ),
          contentPadding: EdgeInsetsDirectional.symmetric(
            horizontal: 20,
          ),
        ),
      ),
    );
  }

  Container _PasswordFormFeild(BuildContext context) {
    return Container(
      // password feild
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            50,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              offset: Offset(0.0, 2.0),
              blurRadius: 3.0,
            ),
          ],
          color: Colors.white),
      child: FormBuilderTextField(
        name: S.of(context).password,
        style: _customLocalTextStyle,
        obscureText: obscuringTextOrNot == true ? true : false,
        controller: signUpPasswordTextEditingController,
        decoration: InputDecoration(
          hintText: S.of(context).password,
          hintStyle: _customLocalTextStyle,
          border: InputBorder.none,
          suffix: InkWell(
            child: obscuringTextOrNot == true
                ? FaIcon(
                    FontAwesomeIcons.eyeLowVision,
                    color: AppColors.mainGreyColor,
                  )
                : FaIcon(
                    FontAwesomeIcons.eye,
                    color: AppColors.mainGreyColor,
                  ),
            onTap: () {
              print("setttttttttttttttttttttttttttttttttttt");
              setState(() {
                obscuringTextOrNot == true
                    ? obscuringTextOrNot = false
                    : obscuringTextOrNot = true;
              });
            },
          ),
          contentPadding: EdgeInsetsDirectional.symmetric(
            horizontal: 20,
          ),
        ),
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        50,
      ),
      onTap: () {
        navigateToWithReplacement(context, const HomeScreen());
      },
      child: Container(
        height: 40,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.mainGreyColor,
            borderRadius: BorderRadius.circular(
              50,
            )),
        child: Text(
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          S.of(context).signUp,
        ),
      ),
    );
  }
}

class _UserEmailFormFeild extends StatelessWidget {
  const _UserEmailFormFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // user email feild
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            50,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              offset: Offset(0.0, 2.0),
              blurRadius: 3.0,
            ),
          ],
          color: Colors.white),
      child: FormBuilderTextField(
        name: S.of(context).email,
        style: _customLocalTextStyle,
        controller: signUpserEmailTextEditingController,
        validator: (value) {},
        decoration: InputDecoration(
          hintText: S.of(context).email,
          hintStyle: _customLocalTextStyle,
          border: InputBorder.none,
          contentPadding: EdgeInsetsDirectional.symmetric(
            horizontal: 20,
          ),
        ),
      ),
    );
  }
}

class _UserNameFormFeild extends StatelessWidget {
  const _UserNameFormFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // user name feild
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            50,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              offset: Offset(0.0, 2.0),
              blurRadius: 3.0,
            ),
          ],
          color: Colors.white),
      child: FormBuilderTextField(
        name: S.of(context).email,
        style: _customLocalTextStyle,
        controller: signUserNameTextEditingContorller,
        validator: (value) {},
        decoration: InputDecoration(
          hintText: S.of(context).userName,
          hintStyle: _customLocalTextStyle,
          border: InputBorder.none,
          contentPadding: EdgeInsetsDirectional.symmetric(
            horizontal: 20,
          ),
        ),
      ),
    );
  }
}
