import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/view/cart/cart_screen.dart';
import 'dart:math' as math;

import 'package:select_shop/view/home/bloc/home_bloc.dart';
import 'package:select_shop/view/home/widgets/bottom%20nav%20bar/bloc/bottom_nav_bloc.dart';
import 'package:select_shop/view/home/widgets/drawer/bloc/drawer_bloc.dart';

class CustomFloatingAcctionButton extends StatelessWidget {
  const CustomFloatingAcctionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: math.pi / 4,
      child: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          // navigateTo(context, CartScreen());
          // context.read<HomeBloc>().bottomNavBarTapded(newPageNumber: 3);
          context.read<BottomNavBloc>().add(BottomNavBarTapdedEvent(
                // 3 to change the main active page into the new page, and page 3 is the FAB page, or let's say it's cart page
                tappdedPageNumber: 3,
              ));

          context.read<DrawerBloc>().activeDrawerPage = 6;
        },
        backgroundColor: AppColors.main2Color,
        child: Transform.rotate(
            angle: -(math.pi / 4),
            child: SvgPicture.asset(
              color: Colors.white,
              width: 30,
              height: 30,
              AppImagesSvg.mycartSvg,
            )),
      ),
    );
  }
}
