// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/view/Shared/appbar.dart';
import 'package:select_shop/view/Shared/bottom_nav_bar.dart';
import 'package:select_shop/view/Shared/floating_acction_button.dart';
import 'package:select_shop/view/Shared/product_container.dart';


class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          children: [
            AppConstants.emptySpaceTenPixl,
            AppConstants.emptySpaceTenPixl,
            AppConstants.emptySpaceTenPixl,
            ProductContainer(),
            ProductContainer(),
            ProductContainer(),
            ProductContainer(),
            ProductContainer(),
            ProductContainer(),
            ProductContainer(),
            ProductContainer(),
            ProductContainer(),
            ProductContainer(),
            ProductContainer(),
            ProductContainer(),
            ProductContainer(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingAcctionButton(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

