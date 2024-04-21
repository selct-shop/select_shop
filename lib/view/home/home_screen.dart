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
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/l10n/app_localizations.dart';
import 'package:select_shop/view/Shared/loading_screen.dart';
import 'package:select_shop/view/Shared/under_develop_screen.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/functions.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/view/cart/cart_screen.dart';
import 'package:select_shop/view/categories/categories_screen.dart';
import 'package:select_shop/view/favourite/favourite_screen.dart';
import 'package:select_shop/view/home/appbar.dart';
import 'package:select_shop/view/home/bloc/home_bloc.dart';
import 'package:select_shop/view/personal/personal_screen.dart';
//
//
part 'bottom_nav_bar.dart';
part 'drawer.dart';

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
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // final homeBloc = BlocProvider.of<HomeBloc>(context);

    return SafeArea(
      // top: false,
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: CustomAppBar(),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CartScreen();
            }));
          },
          backgroundColor: AppColors.mainColor,
          // child: Image.asset(
          //   AppImages.cartBig,
          // ),

          child: Icon(size: 35, Icons.shopping_cart_rounded),
        ),
        // body: homeBody(context),

// body: BlocConsumer<HomeBloc, HomeState>(
//   listener: (context, state) {

//   },
//   // bloc: homeBloc ,
//   builder: (context, state) {
//   return homeBody(context);
// },),

        body: BlocBuilder<HomeBloc, HomeState>(
          // listener: (context, state) {

          // },
          // bloc: homeBloc ,
          builder: (context, state) {
            if (context.read<HomeBloc>().activePageNumber == 1) {
              return homeBody(context);
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
        bottomNavigationBar: _CustomBottomNavBar(),
        resizeToAvoidBottomInset: false, // Set this to false
      ),
    );
  }

  SingleChildScrollView homeBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 170,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  clipBehavior: Clip.hardEdge,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 1,
                      // height: 75,

                      scrollDirection: Axis.vertical,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),

                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: [1, 2, 3].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          // return Container(
                          //   height: 170,

                          //   width: MediaQuery.of(context).size.width - 30,

                          //   decoration: BoxDecoration(
                          //     color: Colors.amber,
                          //     image: DecorationImage(
                          //       image: AssetImage(
                          //         AppImages.mainCarouselSlider,
                          //       ),
                          //     ),
                          //   ),
                          //   // child: Image.asset(
                          //   //     fit: BoxFit.fill,
                          //   //     height: 170,
                          //   //     // width: double.infinity,
                          //   //     // height: double.infinity,
                          //   //     AppImages.mainCarouselSlider),
                          // );

                          return Image(
                              height: 170,
                              width: double.infinity,
                              fit: BoxFit.fill,
                              image: AssetImage(
                                AppImages.mainCarouselSlider,
                              ));
                        },
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 46,
                  child: SizedBox(
                    height: 80,
                    // width: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < 3; i++)
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            // width: _currentIndex == i ? 20 : 8.0,
                            width: 5,
                            height: 20,
                            margin: EdgeInsets.symmetric(horizontal: 2.0),
                            decoration: BoxDecoration(
                              // shape: BoxShape.circle,
                              color: _currentIndex == i
                                  ? AppColors.mainColor
                                  : Colors.grey,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        offset: Offset(3, 4),
                        color: AppColors.mainGreyColor.withOpacity(.2))
                  ],
                  borderRadius: BorderRadius.circular(6)),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return UnderDevScreen();
                      }));
                    },
                    child: Container(
                      width: 130,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(6),
                          )),
                      child: Text(
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          "categorys"),
                    ),
                  ),

// ##### this FormBuilder is casuing problems ##### //

                  // FormBuilder(
                  //   child: FormBuilderTextField(
                  //     name: "Search",
                  //     // style: _customLocalTextStyle,

                  //     // controller: TextEditingController?,

                  //     decoration: InputDecoration(
                  //       hintText: "Search...",
                  //       // hintStyle: _customLocalTextStyle,
                  //       border: InputBorder.none,
                  //       contentPadding: EdgeInsetsDirectional.symmetric(
                  //         horizontal: 20,
                  //       ),
                  //     ),
                  //   ),
                  // )

// #####  ##### //

//                       SearchBar(
//                         hintText: "Search...",

// // textStyle: TextStyle(color: ),
//                       ),

                  // AnimSearchBar(
                  //   width: 400,
                  //   textController: _searchTextEditingController,
                  //   onSuffixTap: () {
                  //     setState(() {
                  //       _searchTextEditingController.clear();
                  //     });
                  //   },
                  //   onSubmitted: (value) {},
                  // ),

                  // FormField(builder: (context) {
                  //   return Text('search');
                  // },
                  // ),
                  //
                  //

                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.search,
                    color: AppColors.mainGreyColor.withOpacity(.3),
                    size: 26,
                  ),

                  Text(
                    style: _customLocalTextStyle.copyWith(
                        fontSize: 18,
                        color: AppColors.mainGreyColor.withOpacity(.3),
                        backgroundColor: Colors.white),
                    "Search...",
                  ),
                ],
              ),
            ),

            ////////////////////////////////
            ///
            ///
            ///
            ////////////////////////////////

            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  style: _customTitleTextStyle,
                  "Categories: ",
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return UnderDevScreen();
                    }));
                  },
                  child: Text(
                    style: _customTitleTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.mainColor),
                    "show all:",
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            Container(
              // height: 140,
              height: 170,

              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: AppColors.mainColor.withOpacity(.2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i < 10; i++)
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColors.mainGreyColor.withOpacity(.3),
                                  blurRadius: 3,
                                  offset: Offset(3, 3),
                                ),
                              ],
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  AppImages.mainCarouselSlider,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          style: _customTitleTextStyle.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                          "Categories ",
                        ),
                      ],
                    ),
                ],
              ),
            ),

            ////////////////////////////
            ///
            ///
            ///////////////////////////

            CustomBanar(),

            ////////////////////////////
            ///
            ///
            ///////////////////////////
            CustomBanar(),

            ////////////////////////////
            ///
            ///
            ///////////////////////////
            CustomBanar(),

            ////////////////////////////
            ///
            ///
            ///////////////////////////
            CustomBanar(),

            ////////////////////////////
            ///
            ///
            ///////////////////////////
          ],
        ),
      ),
    );
  }
}


class CustomBanar extends StatelessWidget {
  const CustomBanar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              style: _customTitleTextStyle,
              "Most Wanted: ",
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UnderDevScreen();
                }));
              },
              child: Text(
                style: _customTitleTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.mainColor),
                "show all:",
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UnderDevScreen();
            }));
          },
          child: Container(
            // height: 140,
            height: 280,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.mainGreyColor.withOpacity(.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < 10; i++)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return UnderDevScreen();
                      }));
                    },
                    child: Container(
                      width: 180,
                      height: 170,
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
                                    color: Colors.red,
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
                                        "new",
                                        style: _customTitleTextStyle.copyWith(
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
                                          style: TextStyle(fontSize: 10),
                                          "Category:"),
                                      Text(
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: AppColors.mainColor),
                                          "home"),
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
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          "women sport shose"),
                                      Spacer(),
                                      Text(
                                        "chanel".toUpperCase(),
                                        style: _customTitleTextStyle.copyWith(
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
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          "AED 350"),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "AED 266".toUpperCase(),
                                        style: _customTitleTextStyle.copyWith(
                                          fontSize: 10,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 38,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          color: AppColors.mainColor
                                              .withOpacity(.1),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}