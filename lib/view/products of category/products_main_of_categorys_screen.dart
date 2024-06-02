// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

//this import casing broplems
// import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/main.dart';
import 'package:select_shop/models/sub%20categories%20model/sub_categories_model.dart';
import 'package:select_shop/view/Shared/app_button.dart';
import 'package:select_shop/view/Shared/app_no_data.dart';
import 'package:select_shop/view/Shared/appbar.dart';
import 'package:select_shop/view/Shared/drawer.dart';
import 'package:select_shop/view/Shared/error_screen.dart';
import 'package:select_shop/view/Shared/loading_screen.dart';
import 'package:select_shop/view/Shared/product_card.dart';
import 'package:select_shop/view/Shared/search_container.dart';
import 'package:select_shop/view/Shared/under_develop_screen.dart';
import 'package:select_shop/view/products%20of%20category/pro%20of%20cat%20bloc/pro_of_cat_bloc.dart';
import 'package:select_shop/view/products%20of%20category/product%20of%20main%20cate%20bloc/product_of_main_category_bloc.dart';
import 'package:select_shop/view/products%20of%20category/sub%20cate%20bloc/sup_categories_of_main_category_bloc.dart';

// part of "home_screen.dart"
// part of 'package:select_shop/view/home/home_screen.dart';

class ProductsOfCategoryScreen extends StatefulWidget {
  final int mainCategoryId;
  const ProductsOfCategoryScreen({super.key, required this.mainCategoryId});

  @override
  State<ProductsOfCategoryScreen> createState() =>
      _ProductsOfCategoryScreenState();
}

class _ProductsOfCategoryScreenState extends State<ProductsOfCategoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    // context.read<ProductOfMainCategoryBloc>().add(ProductsOfCategoryInitalEvent(
    //     theMainCategoryID: widget.mainCategoryId));

    context.read<SupCategoriesOfMainCategoryBloc>().add(
        SubCategoriesOfMainCateInitalEvent(mainCatID: widget.mainCategoryId));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Hero(
          tag: "search",
          child: Scaffold(
            drawer: CustomDrawer(
              theHomeBuildContext: context,
            ),
            appBar: CustomAppBar(),
            body: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: BlocBuilder<ProOfCatBloc, ProOfCatState>(
                    builder: (context, state) {
                      return BlocBuilder<SupCategoriesOfMainCategoryBloc,
                          SupCategoriesOfMainCategoryState>(
                        // builder: (context, state) {
                        //   if (state is ProductsOfMainCategoryLoadedState
                        //       // &&
                        //       // (context
                        //       //             .read<ProductOfMainCategoryBloc>()
                        //       //             .loadingSubCategoriesState ==
                        //       //         false &&
                        //       //     context
                        //       //             .read<ProductOfMainCategoryBloc>()
                        //       //             .loadingTheProductsState ==
                        //       //         false)
                        //       ) {
                        //     return _TheBody();
                        //   } else if (state is ProductsOfMainCategoryErrorState) {
                        //     return Center(
                        //       child: CustomLoadingScreen(),
                        //     );
                        //   } else {
                        //     return const Center(
                        //       child: CustomLoadingScreen(),
                        //     );
                        //   }
                        // },

                        builder: (context, state) {
                          // loading state
                          // if (state is SupCategoriesOfMainCategoryLoadingState) {
                          //   return CustomLoadingScreen();
                          // }

                          // inital  state
                          // if (state is ProductsOfMainCategoryInitialState) {
                          // if (state is ProductsOfMainCategoryLoadingState) {
                          //   return const Center(
                          //     child: CustomLoadingScreen(),
                          //   );
                          // }

                          // error state
                          // if (state is SupCategoriesOfMainCategoryErrorState) {
                          //   return Center(
                          //     child: ErrorScreen(
                          //       errorMessage: "eeeeeeeee",
                          //     ),
                          //   );
                          // }

                          //  if(state is SupCategoriesOfMainCategorySucsessState){
                          // sucsses and defualt state
                          return _TheBody();
                          // return Container(
                          //   color: Colors.amber,
                          //   width: double.infinity,
                          //   height: 600,
                          // );
                          //  }else{
                          //     return Container(
                          //       color: Colors.amber,
                          //       width: double.infinity,
                          //       height: 600,
                          //     );
                          //  }
                        },
                      );
                    },
                  )),
            ),

            // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            // floatingActionButton: CustomFloatingAcctionButton(),
            // bottomNavigationBar: CustomBottomNavBar(),
            // resizeToAvoidBottomInset: false, // Set this to false
          ),
        ),
      ),
    );
  }
}

class _TheBody extends StatelessWidget {
  const _TheBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupCategoriesOfMainCategoryBloc,
        SupCategoriesOfMainCategoryState>(
      // bloc: ProductOfMainCategoryBloc(),
      builder: (context, state) {
        if (state is SupCategoriesOfMainCategorySucsessState) {
          List<SubCategoriesResult> theState =
              state.subCategoriesOfMainCategoresModle.result;
          return DefaultTabController(
            // length: context
            //         .read<ProductOfMainCategoryBloc>()
            //         .subCategoriesList
            //         .length +
            //     1,
            // length: theState.length + 1,
            length: 1,
            child: Column(
              children: [
                const SizedBox(
                  // height: 45,
                  height: 20,
                ),
                SearchContainer(),
                const SizedBox(
                  // height: 30,
                  height: 20,
                ),
                TabBar(
                  padding: EdgeInsets.zero,
                  isScrollable: true,
                  // indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(),
                  labelPadding: EdgeInsets.zero,
                  enableFeedback: true,
                  // indicatorPadding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,
                  // unselectedLabelColor: Colors.black,

                  tabs: [
                    Tab(
                      // all products
                      iconMargin: EdgeInsets.zero,
                      icon: _TabTitle(
                        theTitle: S.of(context).showAll,
                      ),
                    ),
                    // for (int i = 0; i < theState.length; i++)
                    //   Tab(
                    //     iconMargin: EdgeInsets.zero,
                    //     icon: _TabTitle(
                    //       theTitle:
                    //           Localizations.localeOf(context).languageCode ==
                    //                   "ar"
                    //               ? theState[i].nameAr
                    //               : theState[i].nameEn,
                    //     ),
                    //   ),
                  ],
                ),
                // if (state
                //     is ProductsOfMainCategoryGetSubCategoryProductsSuccessState)
                Expanded(
                  child: TabBarView(
                    children: [
                      // #### all product pages #### //
                      // if (theState.isEmpty)
                      Center(
                        child: AppNoData(),
                      )
                      // else
                      //   Icon(
                      //     Icons.all_inbox_rounded,
                      //   ),

                      ///
                      ///
                      ///
                      ///
                      ///
                      // #### the rest of product pages #### //
                      // if (context
                      //     .read<ProductOfMainCategoryBloc>()
                      //     .productsOfACategoryResultList
                      //     .isEmpty)
                      // for (int i = 0; i < theState.length + 1; i++)
                      // Center(
                      //   child: AppNoData(),
                      // )

                      // Column(
                      //   children: [
                      //     const SizedBox(
                      //       height: 10,
                      //       width: 10,
                      //     ),
                      //     GridView.builder(
                      //         shrinkWrap: true,
                      //         gridDelegate:
                      //             SliverGridDelegateWithFixedCrossAxisCount(
                      //           crossAxisCount: 2,
                      //           childAspectRatio: .6,
                      //           crossAxisSpacing: 5,
                      //           mainAxisSpacing: 15,
                      //         ),
                      //         itemBuilder: (context, index) {
                      //           // return ProductCard(
                      //           //   width: 180,
                      //           //   height: 170,
                      //           //   withShado: true,
                      //           //   onTap: () {
                      //           //     navigateTo(context, UnderDevScreen());
                      //           //   },
                      //           //   // newPrice: 400,
                      //           //   // productCategory: "men",
                      //           //   // productName: "t-shirt",
                      //           //   // ratingNumber: 3.8,                                    ,
                      //           // );

                      //           return const SizedBox(
                      //             child: Icon(Icons.directions_car),
                      //           );
                      //         }),
                      //   ],
                      // )
                      // else
                      // for (int i = 0;
                      //     i <theState.length;
                      //     i++)
                      //   Icon(Icons.directions_car),

                      // Icon(Icons.directions_car),
                      // Icon(Icons.directions_transit),
                      // Icon(Icons.directions_bike),
                      // _CustomTabChild(),
                      // _CustomTabChild(),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
// any other state of SubCatOfMainCat
        else {
          return CustomLoadingScreen();
        }
      },
    );
  }
}

class _CustomTabChild extends StatelessWidget {
  const _CustomTabChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text("childdddd"));
  }
}

class _TabTitle extends StatelessWidget {
  final String? theTitle;
  const _TabTitle({
    super.key,
    required this.theTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      alignment: Alignment.center,
      width: null,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        // vertical: 0,
      ),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: AppColors.grey2Color.withOpacity(.1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        border: Border.all(
          color: AppColors.greyColor,
        ),
      ),
      child: Text(
        theTitle ?? "  ",
        style: TextStyle(
          color: AppColors.mainColor,
          fontWeight: FontWeight.w900,
          fontSize: 18,
          height: .8,
        ),
      ),
    );
  }
}
