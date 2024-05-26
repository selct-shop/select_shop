import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/view/Shared/under_develop_screen.dart';
import 'package:select_shop/view/home/bloc/home_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(
        55,
      );
  CustomAppBar({
    Key? key,

    // this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(155),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        // height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              // color: Colors.grey.withOpacity(0.5),
              color: const Color(0xff000000).withOpacity(.16),
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
                // print(
                //     "ddddddddddddddddddddrwer page ${context.read<HomeBloc>().activeDrawerPage}");
              },
              icon: SvgPicture.asset(
                AppImagesSvg.menuSvg,
              ),
            ),
            const Row(
              children: [
                Image(
                  height: 40,
                  width: 40,
                  image: AssetImage(
                    AppImages.logoSmall,
                  ),
                ),
                Image(
                  image: AssetImage(
                    AppImages.selectShopText,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const UnderDevScreen();
                }));
              },
              icon: const Icon(
                  color: AppColors.mainColor,
                  size: 30,
                  Icons.notifications_rounded),
            )
          ],
        ),
      ),
    );
  }
}
