// #### ProductCard #### //
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';

class ProductCard extends StatelessWidget {
  final void Function()? onTap;
  final double? height, width, rating, newPrice, oldPrice;
  final String? productCategory, productName, brandName;

  ProductCard({
    super.key,
    required this.onTap,
    this.height,
    this.width,
    required this.rating,
    required this.newPrice,
    this.oldPrice,
    required this.productCategory,
    required this.productName,
    this.brandName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 170,
        width: width ?? 180,
        margin: EdgeInsets.only(right: 10),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              8,
            )),
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        // fit: BoxFit.none,
                        image: AssetImage(
                          AppImages.mainCarouselSlider,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 45,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8),
                          ),
                          color: Colors.yellow,
                        ),
                        child: Text(
                          S.of(context).theNew,
                          style: AppConstants.customTitleTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(
                  5,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "${S.of(context).category}:",
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          productCategory ?? S.of(context).homePage,
                          style: TextStyle(
                              fontSize: 10, color: AppColors.mainColor),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            for (int i = 1; i <= 5; i++)
                              Icon(
                                size: 12,
                                color: AppColors.mainColor,
                                Icons.star_rounded,
                              )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          productName ?? "shirt",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          brandName != null
                              ? brandName!.toUpperCase()
                              : "chanel".toUpperCase(),
                          style: AppConstants.customTitleTextStyle.copyWith(
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Image.asset(
                          AppImages.chanelLogoJfif,
                          width: 12,
                          height: 12,
                        )
                      ],
                    ),

                    ///
                    ///
                    ///
                    ///

                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          newPrice != null
                              ? "${S.of(context).aed} $newPrice".toUpperCase()
                              : "${S.of(context).aed} uk".toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          oldPrice != null
                              ? "${S.of(context).aed} $oldPrice".toUpperCase()
                              : "${S.of(context).aed} uk".toUpperCase(),
                          style: AppConstants.customTitleTextStyle.copyWith(
                            fontSize: 8,
                            color: Colors.black,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 38,
                          height: 15,
                          decoration: BoxDecoration(
                            color: AppColors.mainColor.withOpacity(.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            height: 10,
                            width: 510,
                            AppImages.cartSmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
