// part of "../home/home_screen.dart";

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/main.dart';
import 'package:select_shop/view/Shared/error_screen.dart';
import 'package:select_shop/view/Shared/loading_screen.dart';
import 'package:select_shop/view/cart/cart_screen.dart';
import 'package:select_shop/view/home/bloc/home_bloc.dart';

TextStyle _customLocalTextStyle = TextStyle(
  color: AppColors.mainGreyColor,
);


TextStyle _customTitleTextStyle = const TextStyle(
  color: AppColors.mainColor,
  fontWeight: FontWeight.bold,
  fontSize: 18,
);

class CustomDrawer extends StatelessWidget {
  BuildContext theHomeBuildContext;
  CustomDrawer({
    super.key,
    required this.theHomeBuildContext,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: BlocProvider(
        create: (context) => HomeBloc(),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeDrawerLoadingState) {
              return Center(
                child: CustomLoadingScreen(),
              );
            } else if (state is HomeDrawerErrorState) {
              return ErrorScreen(errorMessage: "unknown Error");
            } else if (state is HomeDrawerLoadedState) {
              return _DrawerBody(theHomeBuildContext: theHomeBuildContext);
            } else {
              return _DrawerBody(theHomeBuildContext: theHomeBuildContext);
            }
          },
        ),
      ),
    );
  }
}

class _DrawerBody extends StatelessWidget {
  const _DrawerBody({
    super.key,
    required this.theHomeBuildContext,
  });

  final BuildContext theHomeBuildContext;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: AppColors.mainColor,
                        ),
                        // image: DecorationImage(image: CachedNetworkImage(imageUrl:"+" ,))
                        image: const DecorationImage(
                            image: AssetImage(AppImages.tempPerson)),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          globalCachedUserName == "" ||
                                  globalCachedUserName == null
                              ? S.of(context).userName
                              : globalCachedUserName!,
                          style: _customTitleTextStyle,
                        ),
                        Text(
                          globalCachedUserPhoneNum == null ||
                                  globalCachedUserPhoneNum == ""
                              ? S.of(context).userEmail
                              : globalCachedUserPhoneNum!,
                          style: _customLocalTextStyle,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              _CustomDrawerListTile(
                title: S.of(context).homePage,
                onTap: () {
                  // change the drawer for home screen
                  context
                      .read<HomeBloc>()
                      .add(DrawerTapdedEvent(tappdedDrawerItemNumber: 1));

                  // change the bottom nav bar for home screen icon
                  theHomeBuildContext
                      .read<HomeBloc>()
                      .add(BottomNavBarTapdedEvent(tappdedPageNumber: 1));
                },
                listTileNumber: 1,
                isActive: context.read<HomeBloc>().activeDrawerPage == 1
                    ? true
                    : false,
                leading: AppImages.homeSvg,
              ),
              _CustomDrawerListTile(
                title: S.of(context).products,
                onTap: () {
                  context
                      .read<HomeBloc>()
                      .add(DrawerTapdedEvent(tappdedDrawerItemNumber: 2));
                },
                listTileNumber: 2,
                isActive: context.read<HomeBloc>().activeDrawerPage == 2
                    ? true
                    : false,
                leading: AppImages.productsSvg,
              ),
              _CustomDrawerListTile(
                title: S.of(context).tradeMark,
                onTap: () {
                  context
                      .read<HomeBloc>()
                      .add(DrawerTapdedEvent(tappdedDrawerItemNumber: 3));

                  // BlocProvider.of<HomeBloc>(context)
                  //     .add(DrawerTapdedEvent(tappdedDrawerItemNumber: 3));
                },
                listTileNumber: 3,
                isActive: context.read<HomeBloc>().activeDrawerPage == 3
                    ? true
                    : false,
                leading: AppImages.tradeMarkSvg,
              ),
              _CustomDrawerListTile(
                title: S.of(context).specialproducts,
                onTap: () {
                  context
                      .read<HomeBloc>()
                      .add(DrawerTapdedEvent(tappdedDrawerItemNumber: 4));
                },
                listTileNumber: 4,
                isActive: context.read<HomeBloc>().activeDrawerPage == 4
                    ? true
                    : false,
                leading: AppImages.specialproductsSvg,
              ),

              _CustomDrawerListTile(
                title: S.of(context).favourts,
                onTap: () {
                  // change the drawer for the favouret Drawer List Tile
                  context
                      .read<HomeBloc>()
                      .add(DrawerTapdedEvent(tappdedDrawerItemNumber: 5));

                  // change the home screen for the favouret tab
                  theHomeBuildContext
                      .read<HomeBloc>()
                      .add(BottomNavBarTapdedEvent(tappdedPageNumber: 3));
                },
                listTileNumber: 5,
                isActive: context.read<HomeBloc>().activeDrawerPage == 5
                    ? true
                    : false,
                leading: AppImages.favourtsStorkSvg,
              ),
              _CustomDrawerListTile(
                title: S.of(context).mycart,
                onTap: () {
                  context
                      .read<HomeBloc>()
                      .add(DrawerTapdedEvent(tappdedDrawerItemNumber: 6));
                  // pop the drawer and go directley to car screen
                  Navigator.pop(context);
                  navigateTo(context, CartScreen());
                },
                listTileNumber: 6,
                isActive: context.read<HomeBloc>().activeDrawerPage == 6
                    ? true
                    : false,
                leading: AppImages.mycartSvg,
              ),
              _CustomDrawerListTile(
                title: S.of(context).orders,
                onTap: () {
                  context
                      .read<HomeBloc>()
                      .add(DrawerTapdedEvent(tappdedDrawerItemNumber: 7));
                },
                listTileNumber: 7,
                isActive: context.read<HomeBloc>().activeDrawerPage == 7
                    ? true
                    : false,
                leading: AppImages.ordersSvg,
              ),
              _CustomDrawerListTile(
                title: S.of(context).personalPage,
                onTap: () {
                  // change the drawer ListTile for the personal ListTile
                  context
                      .read<HomeBloc>()
                      .add(DrawerTapdedEvent(tappdedDrawerItemNumber: 8));

                  // change the home screen and bottom nav bar for the personal page
                  theHomeBuildContext
                      .read<HomeBloc>()
                      .add(BottomNavBarTapdedEvent(tappdedPageNumber: 4));
                },
                listTileNumber: 8,
                isActive: context.read<HomeBloc>().activeDrawerPage == 8
                    ? true
                    : false,
                leading: AppImages.personalPageSvg,
              ),
              _CustomDrawerListTile(
                title: S.of(context).suppourt,
                onTap: () {
                  context
                      .read<HomeBloc>()
                      .add(DrawerTapdedEvent(tappdedDrawerItemNumber: 9));
                },
                listTileNumber: 9,
                isActive: context.read<HomeBloc>().activeDrawerPage == 9
                    ? true
                    : false,
                leading: AppImages.suppourtSvg,
              ),
              _CustomDrawerListTile(
                title: S.of(context).contactUs,
                onTap: () {
                  context
                      .read<HomeBloc>()
                      .add(DrawerTapdedEvent(tappdedDrawerItemNumber: 10));
                },
                listTileNumber: 10,
                isActive: context.read<HomeBloc>().activeDrawerPage == 10
                    ? true
                    : false,
                leading: AppImages.contactUsSvg,
              ),

              //
              //
              ListTile(
                // titleAlignment: ListTileTitleAlignment.center,
                // selected: true,
                // selectedColor: AppColors.mainColor,
                // selectedTileColor: AppColors.mainColor,
                leading: SvgPicture.asset(
                  // color: isActive == true ? Colors.white : AppColors.mainColor,
                  // leading,
                  color: AppColors.mainColor,
                  AppImages.signOutSvg,
                ),
                title: Text(
                  S.of(context).signOut,
                  style: _customTitleTextStyle.copyWith(
                      color: AppColors.greyColor),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CustomDrawerListTile extends StatelessWidget {
  final void Function()? onTap;
  final bool isActive;
  final int listTileNumber;
  final String leading, title;
  const _CustomDrawerListTile({
    //  @required this.onTap,
    super.key,
    required this.onTap,
    required this.isActive,
    required this.listTileNumber,
    required this.leading,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return InkWell(
          //       onTap: () {
          // // set the new is active
          //         // navigate to the selected screen
          //         onTap;
          //         // print("taaaaaaaaaaaaaaaapeppeped");
          //       },
          onTap: onTap,
          child: Container(
            height: 45,
            width: double.infinity,
            // constraints: ,
            margin: isActive
                ? const EdgeInsets.only(
                    bottom: 10,
                  )
                : const EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color:
                  isActive == true ? AppColors.mainColor : Colors.transparent,
              boxShadow: isActive == true
                  ? [
                      BoxShadow(
                        color: AppColors.mainGreyColor.withOpacity(.2),
                        blurRadius: 5,
                        offset: const Offset(3, 5),
                      ),
                    ]
                  : [],
            ),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppConstants.emptySpaceTenPixl,
                      SizedBox(
                        height: 22,
                        width: 22,
                        child: SvgPicture.asset(
                          color: isActive == true
                              ? Colors.white
                              : AppColors.mainColor,
                          leading,
                        ),
                      ),
                      AppConstants.emptySpaceTenPixl,
                      Text(
                        title,
                        style: _customTitleTextStyle.copyWith(
                          height: .5,
                          color: isActive == true
                              ? Colors.white
                              : AppColors.greyColor,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 22,
                        width: 22,
                        child: Icon(
                          color: isActive == true
                              ? Colors.white
                              : AppColors.greyColor,
                          Icons.arrow_forward_ios,
                        ),
                      ),
                      AppConstants.emptySpaceTenPixl,
                    ],
                  ),
                ),

                isActive == true
                    ? const SizedBox()
                    : listTileNumber ==
                            context.read<HomeBloc>().activeDrawerPage - 1
                        ? const SizedBox()
                        : Divider(
                            endIndent: 10,
                            indent: 10,
                            color: AppColors.greyColor.withOpacity(.15),
                          ),
                // Divider(
                //   color: AppColors.greyColor,
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}







            // ///
            // ///
            // ///

            // Container(
            //   width: double.infinity,
            //   height: 45,
            //   margin: const EdgeInsets.only(
            //     bottom: 15,
            //   ),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     color: Colors.white,
            //     boxShadow: const [
            //       // BoxShadow(
            //       //   color: AppColors.mainGreyColor.withOpacity(.2),
            //       //   blurRadius: 5,
            //       //   offset: Offset(3, 5),
            //       // ),
            //     ],
            //   ),
            //   child: Row(
            //     children: [
            //       SizedBox(
            //         width: 20,
            //       ),
            //       SizedBox(
            //         width: 22,
            //         height: 22,
            //         // child: Image.asset(
            //         //   width: 22,
            //         //   height: 22,
            //         //   AppImages.home,
            //         // ),
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Text(
            //         style:
            //             TextStyle(color: AppColors.mainGreyColor, fontSize: 18),
            //         S.of(context).backToSignIn,
            //       ),
            //       SizedBox(
            //         width: 20,
            //       ),
            //     ],
            //   ),
            // ),

            // ///
            // ///
            // ///

            // Container(
            //   width: double.infinity,
            //   height: 45,
            //   margin: const EdgeInsets.only(
            //     bottom: 15,
            //   ),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     color: Colors.white,
            //     boxShadow: const [
            //       // BoxShadow(
            //       //   color: AppColors.mainGreyColor.withOpacity(.2),
            //       //   blurRadius: 5,
            //       //   offset: Offset(3, 5),
            //       // ),
            //     ],
            //   ),
            //   child: const Row(
            //     children: [
            //       SizedBox(
            //         width: 20,
            //       ),
            //       SizedBox(
            //         width: 22,
            //         height: 22,
            //         // child: Image.asset(
            //         //   width: 22,
            //         //   height: 22,
            //         //   AppImages.home,
            //         // ),
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Text(
            //           style: TextStyle(
            //               color: AppColors.mainGreyColor, fontSize: 18),
            //           "home page"),
            //       SizedBox(
            //         width: 20,
            //       ),
            //     ],
            //   ),
            // ),

            // ///
            // ///
            // ///






                //   ListTile(
                //   contentPadding:
                //       EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                //   // minVerticalPadding: 1,
                //   titleAlignment: ListTileTitleAlignment.center,
                //   // selected: true,
                //   // selectedColor: AppColors.mainColor,
                //   // selectedTileColor: AppColors.mainColor,
                //   leading: SizedBox(
                //     height: 22,
                //     width: 22,
                //     child: SvgPicture.asset(
                //       color: isActive == true ? Colors.white : AppColors.mainColor,
                //       leading,
                //     ),
                //   ),
                //   title: Text(
                //     title,
                //     style: _customTitleTextStyle.copyWith(
                //       height: .5,
                //       color: isActive == true ? Colors.white : AppColors.greyColor,
                //     ),
                //   ),
                
                //   trailing: SizedBox(
                //     height: 22,
                //     width: 22,
                //     child: Icon(
                //       color: isActive == true ? Colors.white : AppColors.greyColor,
                //       Icons.arrow_forward_ios,
                //     ),
                //   ),
                // ),