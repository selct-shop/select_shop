import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/view/cart/cart_screen.dart';
import 'dart:math' as math;

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
          navigateTo(context, CartScreen());
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
