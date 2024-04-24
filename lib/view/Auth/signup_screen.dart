import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:select_shop/l10n/app_localizations.dart';
import 'package:select_shop/view/Shared/under_develop_screen.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/core/theme/light.dart';
import 'package:select_shop/view/Auth/login_screen.dart';
import 'package:select_shop/view/home/home_screen.dart';

bool obscuringTextOrNot = true;
bool? _userAgreementChecked = false;

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
              // Container(
              //   // color: Colors.yellow,
              //   height: size.height * .5,
              //   width: size.width,
              //   child: Stack(
              //     children: [
              //       Positioned(
              //           top: 0,
              //           right: 0,
              //           child: Container(
              //             width: size.width * .45,
              //             height: size.height * .5,
              //             decoration: const BoxDecoration(
              //               color: AppColors.mainColor,
              //               borderRadius: BorderRadius.only(
              //                   bottomLeft: Radius.circular(
              //                 60,
              //               )),
              //             ),
              //           )),
              //       Positioned(
              //         width: size.width,
              //         height: size.height * .5,
              //         right: 0,
              //         bottom: 20,
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.end,
              //           crossAxisAlignment: CrossAxisAlignment.end,
              //           children: [
              //             Expanded(
              //               child: Container(
              //                 width: 235,
              //                 height: 300,
              //                 decoration: BoxDecoration(
              //                   color: Colors.grey[350],
              //                   // color: Colors.red,
              //                   borderRadius: const BorderRadius.only(
              //                     topRight: Radius.circular(50),
              //                     bottomRight: Radius.circular(50),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             const SizedBox(
              //               width: 15,
              //             ),
              //             const Image(
              //               // width: 10,
              //               // height: 10,
              //               image: AssetImage(
              //                 AppImages.selShoHoriText,
              //               ),
              //             ),
              //             const SizedBox(
              //               width: AppConstants.theDefBadding,
              //             )
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),

              Directionality(
                textDirection: TextDirection.ltr,
                child: _AuthCustomIcon(
                  size: size,
                ),
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
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      // "مرحبا بك في متجر سيليكت شوب",

                      AppLocalizations.of(context)!.signUp,
                    ),
                    // const Text(
                    //   style: TextStyle(
                    //     color: AppColors.mainColor,
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 20,
                    //   ),
                    //   // "مرحبا بك في متجر سيليكت شوب",
                    //   "قم بإنشاء حساب للمتابعة",
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    FormBuilder(
                        child: Column(
                      children: [
                        Container(
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
                            name: AppLocalizations.of(context)!.email,
                            style: _customLocalTextStyle,

                            // controller: TextEditingController?,

                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.email,
                              hintStyle: _customLocalTextStyle,
                              border: InputBorder.none,
                              contentPadding: EdgeInsetsDirectional.symmetric(
                                horizontal: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
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
                            name: AppLocalizations.of(context)!.password,
                            style: _customLocalTextStyle,
                            obscureText:
                                obscuringTextOrNot == true ? true : false,
                            // controller: TextEditingController?,
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.password,
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
                                  print(
                                      "setttttttttttttttttttttttttttttttttttt");
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
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
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
                            name: AppLocalizations.of(context)!
                                .confirmNewPassword,
                            style: _customLocalTextStyle,

                            obscureText: obscuringTextOrNot,

                            // controller: TextEditingController?,

                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!
                                  .confirmNewPassword,
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
                                  print(
                                      "setttttttttttttttttttttttttttttttttttt");
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
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor:
                                    AppColors.mainColor, // color of the border
                              ),
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                side: MaterialStateBorderSide.resolveWith(
                                  (states) => BorderSide(
                                      width: 1.0, color: AppColors.mainColor),
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
                              child: Text(
                                AppLocalizations.of(context)!.userAgrement,
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
                            ),
                            // Spacer(),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                          onTap: () {
                            // print("teeeeeeeeeeeeeeest");
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             const UnderDevScreen()));

                            // Navigator.of(context)
                            //     .push(MaterialPageRoute(builder: (context) {
                            //   return HomeScreen();
                            // }));
                            navigateToWithReplacement(
                                context, const HomeScreen());
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
                              AppLocalizations.of(context)!.signUp,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UnderDevScreen()));
                          },
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) {
                                return LogInScreen();
                              }), (route) => false);
                            },
                            child: Text(
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: 12,
                              ),
                              AppLocalizations.of(context)!.youHaveAccount,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Divider(
                                // thickness: 15,
                                // height: 30,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              style: TextStyle(
                                color: AppColors.mainGreyColor,
                                fontSize: 12,
                              ),
                              AppLocalizations.of(context)!.orByUsing,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const UnderDevScreen()));
                              },
                              child: const Image(
                                  image: AssetImage(
                                AppImages.facebook,
                              )),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const UnderDevScreen()));
                              },
                              child: const Image(
                                  image: AssetImage(
                                AppImages.google,
                              )),
                            ),
                          ],
                        ),
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
}

class _AuthCustomIcon extends StatelessWidget {
  const _AuthCustomIcon({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      height: size.height * .5,
      width: size.width,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: Container(
                // width: size.width * .45,
                width: 200,
                height: size.height * .5,
                decoration: const BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                    60,
                  )),
                ),
              )),
          Positioned(
            width: size.width,
            height: size.height * .45,
            right: 0,
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Stack(children: [
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 435,
                        height: 300,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.grey[350],
                            // borderRadius: const BorderRadius.only(
                            //   topRight: Radius.circular(50),
                            //   bottomRight: Radius.circular(50),
                            // ),

                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        // child: Image.asset(
                        //   AppImages.girlLoginScreen,
                        // ),
                      ),
                    ),
                    Center(child: Image.asset(AppImages.girlLoginScreen)),
                  ]),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Image(
                  // width: 10,
                  // height: 10,
                  image: AssetImage(
                    AppImages.selShoHoriText,
                  ),
                ),
                const SizedBox(
                  width: AppConstants.theDefBaddingFifteenPixl,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
