// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/view/Shared/appbar.dart';
import 'package:select_shop/view/Shared/bottom_nav_bar.dart';
import 'package:select_shop/view/Shared/floating_acction_button.dart';
import 'package:select_shop/view/Shared/product_container.dart';
import 'package:select_shop/view/Shared/under_develop_screen.dart';
import 'package:select_shop/view/product%20details/product_details_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          children: [
            AppConstants.emptySpaceTenPixl,
            AppConstants.emptySpaceTenPixl,
            AppConstants.emptySpaceTenPixl,
            for (int i = 1; i < 20; i++)
              ProductContainer(
                brandName: "zara",
                brandNetworkImage: null,
                isDisscountOrNew: true,
                isFavourated: true,
                isDiscountOrNew: true,
                hasPaddings: true,

                productName: 't-shirt',
                categoryName: 'men',
                productDiscreption:
                    'this is just a test for the product discription, and so on',
                oldPrice: '499',
                newPrice: '299',
                productNetworkImage: null,
                productRating: 4.5,
                // width: ,
                // height: null,
                onTapProductWidget: () {
                  navigateTo(context, ProductDetailsScreen());
                },
                onTapAddOrRemoveFav: () {
                  navigateTo(context, UnderDevScreen());
                },
              ),
          ],
        ),
      ),
    );
  }
}
