// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/view/home/bloc/home_bloc.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5,
        // vertical: 10,
      ),
      width: double.infinity,
      height: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.mainGreyColor.withOpacity(.1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Row(
        children: [
          AppConstants.emptySpaceTenPixl,

          _bottomNavBarIcon(
            title: S.of(context).homePage,
            svgImageName: AppImagesSvg.homeSvg,
            screenNumber: 1,
            // isActive: context.read<HomeBloc>().activePageNumber == ,
          ),
          Spacer(),

          _bottomNavBarIcon(
            title: S.of(context).categorys,
            svgImageName: AppImagesSvg.categorisSvg,
            screenNumber: 2,
          ),

          //////
          ///
          ///
          Spacer(),
          Spacer(),
          //////
          ///
          ///
          _bottomNavBarIcon(
            title: S.of(context).favourts,
            svgImageName: AppImagesSvg.favourtsStorkSvg,
            screenNumber: 4,
          ),
          Spacer(),

          _bottomNavBarIcon(
            title: S.of(context).personalPage,
            svgImageName: AppImagesSvg.personalPageSvg,
            screenNumber: 5,
          ),

          AppConstants.emptySpaceTenPixl,
        ],
      ),
    );
  }
}

class _bottomNavBarIcon extends StatelessWidget {
  final String svgImageName, title;
  final int screenNumber;
  // final bool isActive;
  _bottomNavBarIcon({
    super.key,
    required this.svgImageName,
    required this.title,
    required this.screenNumber,
    //  required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context
                .read<HomeBloc>()
                .add(BottomNavBarTapdedEvent(tappdedPageNumber: screenNumber));

            // context.read<HomeBloc>().add(BottomNavBarTapdedEvent(
            //     tappdedPageNumber: screenNumber
            //     ));
          },
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                height: 25,
                width: 25,
                // all this if conditions for the fav icon,
                // to determine if its active or not
                screenNumber == 4
                    ? (context.read<HomeBloc>().activePageNumber == screenNumber
                        ? AppImagesSvg.favourFilledSvg
                        : svgImageName)
                    : svgImageName

                // svgImageName,

                // color: isActive ? AppColors.mainColor: AppColors.grey2Color,
                ,
                color: context.read<HomeBloc>().activePageNumber == screenNumber
                    ? AppColors.mainColor
                    : AppColors.greyColor,
              ),
              Text(
                title,
                style: TextStyle(
                    color: context.read<HomeBloc>().activePageNumber ==
                            screenNumber
                        ? AppColors.mainColor
                        : AppColors.greyColor,
                    fontSize: 10),
              )
            ],
          ),
        );
      },
    );
  }
}
