// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/theme/colors.dart';

TextStyle _titleTextStyle = TextStyle(
    color: AppColors.mainColor, fontSize: 20, fontWeight: FontWeight.bold);

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15),
      children: [
        const SizedBox(
          height: 05,
        ),
        _CustomCategory(),
        _CustomCategory(),
        _CustomCategory(),
        _CustomCategory(),
        _CustomCategory(),
        _CustomCategory(),
        _CustomCategory(),
        _CustomCategory(),
      ],
    );
  }
}

class _CustomCategory extends StatelessWidget {
  const _CustomCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                AppImages.categories,
              )),
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 4),
                color: AppColors.mainGreyColor.withOpacity(.1),
                spreadRadius: 1,
                blurRadius: 5)
          ],
          // color: AppColors.mainGreyColor,
          borderRadius: BorderRadius.circular(12)),
      width: double.infinity,
      height: 180,

      // alignment: Alignment.centerLeft,
      alignment: Alignment.centerRight,

      padding: EdgeInsets.all(15),
      // child: Text('data'),
      child: Container(
        height: 100,
        width: 170,
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(

            // color: AppColors.mainGreyColor.withOpacity(.1),
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "men clothes",
              style: _titleTextStyle,
            ),
            Text(
              "233 item",
              style: TextStyle(
                color: AppColors.mainGreyColor,
                fontSize: 12,
              ),
            ),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "shop now",
                    style: TextStyle(fontSize: 12, color: AppColors.mainColor),
                  ),
                  Image.asset(
                    AppImages.cartSmall,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
