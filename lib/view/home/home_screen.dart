// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:anim_search_bar/anim_search_bar.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/l10n/app_localizations.dart';
import 'package:select_shop/main.dart';
import 'package:select_shop/models/collection/the_collection_modle.dart';
import 'package:select_shop/view/Shared/app_button.dart';
import 'package:select_shop/view/Shared/app_no_data.dart';
import 'package:select_shop/view/Shared/appbar.dart';
import 'package:select_shop/view/Shared/bottom_nav_bar.dart';
import 'package:select_shop/view/Shared/drawer.dart';
import 'package:select_shop/view/Shared/error_screen.dart';
import 'package:select_shop/view/Shared/floating_acction_button.dart';
import 'package:select_shop/view/Shared/loading_screen.dart';
import 'package:select_shop/view/Shared/product_card.dart';
import 'package:select_shop/view/Shared/search_container.dart';
import 'package:select_shop/view/Shared/under_develop_screen.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/functions.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/view/cart/cart_screen.dart';
import 'package:select_shop/view/categories/categories_screen.dart';
import 'package:select_shop/view/favourite/favourite_screen.dart';
import 'package:select_shop/view/home/widgets/bottom%20nav%20bar/bloc/bottom_nav_bloc.dart';
import 'package:select_shop/view/home/widgets/drawer/bloc/drawer_bloc.dart';
import 'package:select_shop/view/home/widgets/prodcts%20best%20seller/bloc/product_bestseller_bloc.dart';
import 'package:select_shop/view/home/widgets/products%20discounts/bloc/products_discounts_bloc.dart';
import 'package:select_shop/view/home/widgets/products%20laktah/bloc/products_laktah_bloc.dart';
import 'package:select_shop/view/home/widgets/products%20new/bloc/products_new_bloc.dart';
import 'package:select_shop/view/home/bloc/home_bloc.dart';
import 'package:select_shop/view/product%20details%20genral/product_details_genral_screen.dart';
import 'package:select_shop/view/products/products_screen.dart';
import 'package:select_shop/view/products%20of%20category/bloc/product_of_main_category_bloc.dart';
import 'package:select_shop/view/settings/settings_screen.dart';
import 'dart:math' as math;

// import 'package:select_shop/view/search/search_screen.dart';
//
//
// part '../Shared/drawer.dart';
part 'widgets/custom_baner.dart';
part 'body.dart';
part 'package:select_shop/view/search/search_screen.dart';

TextStyle _customTitleTextStyle = TextStyle(
  color: AppColors.mainColor,
  fontWeight: FontWeight.bold,
  fontSize: 18,
);

TextEditingController _searchTextEditingController =
    new TextEditingController();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final homeBloc = BlocProvider.of<HomeBloc>(context);

    return Hero(
        tag: "search",
        child: Scaffold(
          body: SafeArea(
            child: Scaffold(
              drawer: CustomDrawer(
                theHomeBuildContext: context,
              ),
              appBar: CustomAppBar(),

              body: SafeArea(
                child: BlocBuilder<BottomNavBloc, BottomNavState>(
                  builder: (context, state) {
                    return BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (context.read<BottomNavBloc>().activePageNumber == 1) {
                          return _HomeBody();
                        } else if (context.read<BottomNavBloc>().activePageNumber ==
                            2) {
                          return CategoriesScreen();
                        } else if (context.read<BottomNavBloc>().activePageNumber ==
                            3) {
                          return CartScreen();
                        } else if (context.read<BottomNavBloc>().activePageNumber ==
                            4) {
                          return FavoureitesScreen();
                        } else if (context.read<BottomNavBloc>().activePageNumber ==
                            5) {
                          return SettingsScreen();
                        } else {
                          return CustomLoadingScreen();
                        }
                      },
                    );
                  },
                ),
              ),

              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: CustomFloatingAcctionButton(),
              bottomNavigationBar: CustomBottomNavBar(),
              resizeToAvoidBottomInset: false, // Set this to false
            ),
          ),
        ));
  }
}
