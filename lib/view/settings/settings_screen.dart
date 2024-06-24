// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/functions/signout.dart';
import 'package:select_shop/core/helpers/user_experience_helper.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/main.dart';
import 'package:select_shop/view/Auth/login_screen.dart';
import 'package:select_shop/view/Auth/signup_screen.dart';
import 'package:select_shop/view/Shared/app_button.dart';
import 'package:select_shop/view/Shared/loading_screen.dart';
import 'package:select_shop/view/Shared/under_develop_screen.dart';
import 'package:select_shop/view/edit%20user%20profile/edit_user_profile_screen.dart';
import 'package:select_shop/view/language/chose_language_screen.dart';
import 'package:select_shop/view/track%20order/track_order_screen.dart';
import 'package:select_shop/view/user%20location/user_location_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          // body: ChoseLanguageScreen(
          //   commingFromSettings: true,

          // ),
          body: ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(
                height: 50,
                width: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: Row(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.mainColor,
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                                AppConstants.cachedRandomeNetworkImage),
                          ),
                          // image: const DecorationImage(
                          //     image: AssetImage(AppImages.tempPersonPng),
                          //     fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                        height: 30,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              // user name container
                              alignment: Alignment.centerLeft,
                              height: 45,
                              width: 200,
                              child: Text(
                                globalCachedUserName ??
                                    S.of(context).selectShop,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: AppColors.mainColor,
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    height: .8),
                              ),
                            ),
                            Container(
                              // user ID container
                              alignment: Alignment.centerLeft,
                              height: 30,
                              width: 200,
                              child: Text(
                                "ID #${globalCachedUserID ?? "Select Shop"}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: AppColors.grey2Color,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    height: .8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Spacer(),
                      const SizedBox(
                        width: 30,
                        height: 30,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          // ontap edit user data
                          navigateTo(context, EditUserProfileScreen());
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          // padding: EdgeInsets.all(10),
                          // clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.mainColor,
                            ),
                          ),
                          child: Icon(
                            Icons.edit_rounded,
                            color: AppColors.mainColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
//               const SizedBox(
//                 height: 50,
//                 width: 50,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 15,
//                 ),
//                 child: SizedBox(
//                   child: Column(
//                     children: [
//                       Row(
//                         // orders and favourets buttons
//                         children: [
// // AppButton(title: "orders " ,

// // backgroundColor: Color ,),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 15,
//                         width: 15,
//                       ),
//                       Row(
//                         // copons and help center buttons
//                         children: [],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
              const SizedBox(
                height: 50,
                width: 50,
              ),
              Container(
//  height:   ,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 30,
                ),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: AppColors.grey2Color.withOpacity(.1),
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).accountSettings,
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        height: .8,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                      width: 30,
                    ),
                    _CustomSettingListTile(
                      theTitle: S.of(context).editUser,
                      theSvgPictuer: AppImagesSvg.editUserSvg,
                      hasADivier: true,
                      onTap: () {
                        // navigate to edit personal details
                        navigateTo(context, EditUserProfileScreen());
                      },
                    ),
                    _CustomSettingListTile(
                      theTitle: S.of(context).addLocation,
                      theSvgPictuer: AppImagesSvg.locationFilledSvg,
                      hasADivier: true,
                      onTap: () {
                        // navigate to add new location screen
                        navigateTo(context, UserLocationsScreen());
                      },
                    ),
                    _CustomSettingListTile(
                      theTitle: S.of(context).changeLanguage,
                      theSvgPictuer: AppImagesSvg.langSvg,
                      hasADivier: true,
                      onTap: () {
                        // navigate to edit language screen
                        navigateTo(context,
                            ChoseLanguageScreen(commingFromSettings: true));
                      },
                    ),
                    _CustomSettingListTile(
                      theTitle: S.of(context).trackOrder,
                      theSvgPictuer: AppImagesSvg.truckSvg,
                      hasADivier: true,
                      onTap: () {
                        // navigate to edit language screen
                        navigateTo(context, TrackOrderScreen());
                      },
                    ),
                    _CustomSettingListTile(
                      theTitle: S.of(context).notificationSettings,
                      theSvgPictuer: AppImagesSvg.notificationSvg,
                      hasADivier: true,
                      onTap: () {
                        // navigate to edit personal details
                        navigateTo(context, UnderDevScreen());
                      },
                    ),
                    _CustomSettingListTile(
                      theTitle: S.of(context).helpCenter,
                      theSvgPictuer: AppImagesSvg.suppourtSvg,
                      hasADivier: true,
                      onTap: () {
                        // navigate to help center screen
                        navigateTo(context, UnderDevScreen());
                      },
                    ),
                    _CustomSettingListTile(
                      theTitle: S.of(context).signOut,
                      theSvgPictuer: AppImagesSvg.signOutSvg,
                      onTap: () async {
                        // sign out
                        // if (await signOut()) {
                        //   navigateToWithReplacement(context, LogInScreen());
                        // }

                        UserExperinceHelper().showCustomDialog(
                          theContext: context,
                          dialogContent: "you sure you want to signout !!",
                          confirmButtonTitle: S.of(context).signOut,
                          onConfirm: () async {
                            print("coococococococococococ"); // sign out
                            bool siiiignout = await signOut();
                            // if (await signOut()) {
                            if (siiiignout == true) {
                              navigateToWithReplacement(
                                  context, const LogInScreen());
                            }
                          },
                        );
                      },
                    ),
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

class _CustomSettingListTile extends StatelessWidget {
  final void Function()? onTap;
  final String theTitle, theSvgPictuer;
  final Color? theSvgColor;
  final bool? hasADivier;

  const _CustomSettingListTile({
    super.key,
    required this.onTap,
    required this.theTitle,
    required this.theSvgPictuer,
    this.theSvgColor,
    this.hasADivier,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    height: 24,
                    width: 24,
                    alignment: Alignment.center,
                    color: AppColors.mainColor,
                    // AppImagesSvg.homeSvg,
                    theSvgPictuer,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    // title or the setting name box
                    height: 30,

                    width: 230,

                    child: Text(
                      theTitle,
                      overflow: TextOverflow.ellipsis,
                      // textAlign: TextAlign.start,
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColors.grey2Color,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        height: .8,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            hasADivier == true
                ? Divider(
                    color: AppColors.grey2Color.withOpacity(.2),
                    height: 1,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
