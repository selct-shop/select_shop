// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:select_shop/view/Shared/appbar.dart';
import 'package:select_shop/view/Shared/bottom_nav_bar.dart';
import 'package:select_shop/view/Shared/error_screen.dart';
import 'package:select_shop/view/Shared/floating_acction_button.dart';
import 'package:select_shop/view/Shared/loading_screen.dart';
import 'package:select_shop/view/Shared/search_container.dart';
import 'package:select_shop/view/Shared/under_develop_screen.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/functions.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/view/cart/cart_screen.dart';
import 'package:select_shop/view/categories/categories_screen.dart';
import 'package:select_shop/view/favourite/favourite_screen.dart';
import 'package:select_shop/view/home/bloc/home_bloc.dart';
import 'package:select_shop/view/personal/personal_screen.dart';
import 'dart:math' as math;

// import 'package:select_shop/view/search/search_screen.dart';
//
//
part 'drawer.dart';
part 'custom_paner.dart';
part 'body.dart';
part 'package:select_shop/view/search/search_screen.dart';

TextStyle _customLocalTextStyle = TextStyle(
  color: AppColors.mainGreyColor,
);

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
              drawer: _CustomDrawer(
                theHomeBuildContext: context,
              ),
              appBar: CustomAppBar(),

              body: SafeArea(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (context.read<HomeBloc>().activePageNumber == 1) {
                      return _HomeBody();
                    } else if (context.read<HomeBloc>().activePageNumber == 2) {
                      return CategoriesScreen();
                    } else if (context.read<HomeBloc>().activePageNumber == 3) {
                      return FavoureitesScreen();
                    } else if (context.read<HomeBloc>().activePageNumber == 4) {
                      return PersonalScreen();
                    } else {
                      return CustomLoadingScreen();
                    }
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
