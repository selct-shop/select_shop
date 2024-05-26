// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/main.dart';
import 'package:select_shop/view/Shared/app_button.dart';
import 'package:select_shop/view/Shared/appbar.dart';
import 'package:select_shop/view/Shared/drawer.dart';
import 'package:select_shop/view/Shared/error_screen.dart';
import 'package:select_shop/view/Shared/loading_screen.dart';
import 'package:select_shop/view/Shared/search_container.dart';
import 'package:select_shop/view/products%20of%20category/bloc/product_of_main_category_bloc.dart';

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
    context.read<ProductOfMainCategoryBloc>().add(ProductsOfCategoryInitalEvent(
        theMainCategoryID: widget.mainCategoryId));

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
                child: BlocBuilder<ProductOfMainCategoryBloc,
                    ProductsOfMainCategoryState>(
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
                    if (state is ProductsOfMainCategoryLoadingState) {
                      return CustomLoadingScreen();
                    }

                    // inital  state
                    // if (state is ProductsOfMainCategoryInitialState) {
                    // if (state is ProductsOfMainCategoryLoadingState) {
                    //   return const Center(
                    //     child: CustomLoadingScreen(),
                    //   );
                    // }

                    // error state
                    if (state is ProductsOfMainCategoryErrorState) {
                      return Center(
                        child: ErrorScreen(
                          errorMessage: "eeeeeeeee",
                        ),
                      );
                    }

                    // sucsses and defualt state
                    return _TheBody();
                  },
                ),
              ),
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
    return BlocBuilder<ProductOfMainCategoryBloc, ProductsOfMainCategoryState>(
      // bloc: ProductOfMainCategoryBloc(),
      builder: (context, state) {
        return DefaultTabController(
          length: context
              .read<ProductOfMainCategoryBloc>()
              .subCategoriesList
              .length,
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
                  // Tab(
                  //   // iconMargin: EdgeInsets.zero,
                  //   icon: _TabTitle(
                  //     theTitle: "t-shirt",
                  //   ),

                  //   // child: _CustomTabChild(),
                  // ),
                  // Tab(
                  //   icon: _TabTitle(
                  //     theTitle: "womens",
                  //   ),
                  // ),
                  // Tab(
                  //   icon: _TabTitle(
                  //     theTitle: "t-aaaaa",
                  //   ),
                  // ),
                  // Tab(
                  //   icon: _TabTitle(
                  //     theTitle: "t-bbbbb",
                  //   ),
                  // ),
                  // Tab(
                  //   icon: _TabTitle(
                  //     theTitle: "t-ccccc",
                  //   ),
                  // ),

                  for (int i = 0;
                      i <
                          context
                              .read<ProductOfMainCategoryBloc>()
                              .subCategoriesList
                              .length;
                      i++)
                    Tab(
                      iconMargin: EdgeInsets.zero,
                      icon: _TabTitle(
                        theTitle: 
                        globalCachedUserLang == "ar" ? 
                        
                        context
                            .read<ProductOfMainCategoryBloc>()
                            .subCategoriesList[i]
                            .nameAr:
                        context
                            .read<ProductOfMainCategoryBloc>()
                            .subCategoriesList[i]
                            .nameEn,
                      ),
                    ),
                ],
              ),
              // if (state
              //     is ProductsOfMainCategoryGetSubCategoryProductsSuccessState)
              Expanded(
                
                child: TabBarView(
                  children: [
                    for (int i = 0;
                        i <
                            context
                                .read<ProductOfMainCategoryBloc>()
                                .subCategoriesList
                                .length;
                        i++)
                      Icon(Icons.directions_car),

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
