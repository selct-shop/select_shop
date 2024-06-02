// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

//this import casing broplems
// import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as FreamWorkImage;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/main.dart';
import 'package:select_shop/models/products%20of%20category%20models/products_of_category_model.dart';
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

// Key? subCateBlocKey = Key();
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
      // key: ,
      // bloc: ProductOfMainCategoryBloc(),
      builder: (context, state) {
        if (state is SupCategoriesOfMainCategorySucsessState) {
          List<SubCategoriesResult> theState =
              state.subCategoriesOfMainCategoresModle.result;
// final TabController tabController = new TabController(length: theState.length+1, vsync: vsync);
          return DefaultTabController(
            // length: context
            //         .read<ProductOfMainCategoryBloc>()
            //         .subCategoriesList
            //         .length +
            //     1,
            length: theState.length + 1,
            // length: 1,
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
                  // controller: ,

                  tabs: [
                    Tab(
                      // all products
                      iconMargin: EdgeInsets.zero,
                      icon: _TabTitle(
                        theTitle: S.of(context).showAll,
                      ),
                    ),
                    for (int i = 0; i < theState.length; i++)
                      Tab(
                        iconMargin: EdgeInsets.zero,
                        icon: _TabTitle(
                            theTitle:
                                // Localizations.localeOf(context).languageCode ==
                                //         "ar"
                                //     ? theState[i].nameAr
                                //     : theState[i].nameEn,
                                "tessst"),
                      ),
                  ],
                ),
                // if (state
                //     is ProductsOfMainCategoryGetSubCategoryProductsSuccessState)
                Expanded(
                  child: BlocBuilder<ProductOfMainCategoryBloc,
                      ProductsOfMainCategoryState>(
                    builder: (context, state) {
                      key:
                      if (state is ProductsOfMainCategorySucsessState &&
                              context
                                      .watch<SupCategoriesOfMainCategoryBloc>()
                                      .state
                                  is SupCategoriesOfMainCategorySucsessState
                          // context.read<SupCategoriesOfMainCategoryState>().

                          ) {
                        return TabBarView(
                          children: [
                            // #### all product pages #### //
                            // if (theState.isEmpty)
                            Center(
                              child: AppNoData(),
                            ),
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

                            // if (state is ProductsOfMainCategorySucsessState)

                            //    Center(
                            //     child: Text(theState[i].nameAr),

                            // )

                            for (int i = 0; i < theState.length; i++)
                              // Center(
                              //   child: AppNoData(),
                              //   // child: Text(theState[i].nameAr),
                              // )

                              Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                    width: 10,
                                  ),
                                  GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        
                                        childAspectRatio: .6,
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 15,
                                      ),
                                      // itemBuilder: (context, index) {
                                      //   return _ProductCard(
                                      //     width: 180,
                                      //     height: 170,
                                      //     withShado: true,
                                      //     // onTap: () {
                                      //     //   navigateTo(context, UnderDevScreen());
                                      //     // },
                                      //     // newPrice: 400,
                                      //     // productCategory: "men",
                                      //     // productName: "t-shirt",
                                      //     // ratingNumber: 3.8,                                    ,
                                      //   );

                                      //   // return const SizedBox(
                                      //   //   child: Icon(Icons.directions_car),
                                      //   // );
                                      // }, 


                                       itemBuilder: (context, index) {
                                        
                                        return _ProductCard(
                                          width: 180,
                                          height: 170,
                                          withShado: true,
                                          // onTap: () {
                                          //   navigateTo(context,
                                          //       ProductDetailsScreen(
                                          //         theProductModle: ,
                                          //       ));
                                          //   // and then pass the product of state.newProductsList[index]
                                          // },
                                          theeProductStatus: null,
                                          theCategoryProduct: context.read<ProductOfMainCategoryBloc>().productsOfACategoryResultList[index]!   ,
                                              // theStockNumber: state.theCollectionModel.result.totalCount,

// theCollectionModel: state.theCollectionModel,
                                        );
                                      }
                                      
                                      
                                      
                                      ),
                                ],
                              )
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
                        );
                      } else {
                        return TabBarView(
                          children: [
                            for (int i = 0; i < theState.length + 1; i++)
                              Center(
                                child: CircularProgressIndicator(
                                  color: Colors.amber,
                                ),
                              ),
                          ],
                        );
                      }
                    },
                  ),
                ),

                // Expanded(
                //   child: TabBarView(
                //     children: [
                //       Center(
                //         child: AppNoData(),
                //       ),
                //       for (int i = 0; i < theState.length; i++)
                //         Center(
                //           child: AppNoData(),
                //         ),
                //     ],
                //   ),
                // ),
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






// #### #### //
// #### #### //
// #### #### //
// #### #### //
// #### #### //
// #### #### //





class _ProductCard extends StatelessWidget {
  // final void Function()? onTap;
  final double? height, width;
  // final double? ratingNumber, newPrice, oldPrice;
  // final String? productCategory, productName, brandName;
  // i use this shadow to give it card affect, and it's defalt true
  final bool? withShado;
  final String? theeProductStatus;
  // final TheProductModel theProduct;
  final CategoryProduct theCategoryProduct;
  // final int theStockNumber;
  // final TheCollectionModel theCollectionModel; 

  _ProductCard({
    super.key,
    // required this.onTap,
    this.height,
    this.width,
    // this.shadow,
    // required this.ratingNumber,
    // required this.newPrice,
    // this.oldPrice,
    // required this.productCategory,
    // required this.productName,
    // this.brandName,
    required this.withShado,
    this.theeProductStatus,
    // required this.theProduct,
    required this.theCategoryProduct,
    // required this.theStockNumber, 
    // required this.theCollectionModel, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
      onTap: () {
        // navigateTo(context,
        // ProductDetailsCollectionScreen(theCollectionProduct: theCollectionProduct , 
        // // theStockNumber: theStockNumber,
        // theCollectionModel: theCollectionModel,
        
        // ), 
        // );
      },
      // borderRadius: BorderRadius.circular(
      //   10,
      // ),
      child: Container(
        height: height ?? 170,
        width: width ?? 180,
        margin: EdgeInsets.only(right: 10),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            10,
          ),
          boxShadow: withShado == true ? AppConstants.theLightBoxShdow : null,
        ),
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
                        // image: AssetImage(
                        //   AppImages.mainCarouselSliderPng,
                        // ),

// image: FreamWorkImage.Image(image: FreamWorkImage.NetworkImage,)
                        image: FreamWorkImage.NetworkImage(
                            // theCollectionProduct.mainImages[0].
                            theCategoryProduct.mainImages

                            // ??
                            //     globalDefaltCachedNetworkImage,
                            ),

                        //  image: FreamWorkImage.NetworkImage(
                        //   theProduct.result.mainImages[0] ?? globalDefaltCachedNetworkImage ,
                        // ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      theeProductStatus == null || theeProductStatus == ""
                          ? const SizedBox()
                          :

                          // theProduct.productStatus.where(theeProductStates) == true?
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
                                // new, disscount, laktah,
                                // S.of(context).theNew,

                                // theProduct.productStatus.where(theeProductStates) == true ?
                                theeProductStatus!,
                                style:
                                    AppConstants.customTitleTextStyle.copyWith(
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
                          // productCategory ?? S.of(context).homePage,
                          Localizations.localeOf(context).languageCode == "ar"
                              // ? theProduct..categories.first.category.nameAr
                              // ? theProduct.result.categories[0].category.nameAr
                              // : theProduct.result.categories[0].category.nameEn,

                              ///
                              ///

                              ? theCategoryProduct
                                  .categories[0].category.nameAr
                              : theCategoryProduct
                                  .categories[0].category.nameEn,
                          style: TextStyle(
                              fontSize: 10, color: AppColors.mainColor),
                        ),
                        Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // for (int i = 1; i <= 5; i++)
                            //   Icon(
                            //     size: 12,
                            //     color: AppColors.mainColor,
                            //     Icons.star_rounded,
                            //   )

                            RatingBar(
                              glow: false,
                              ignoreGestures: true,
                              // initialRating: ratingNumber ?? 0,
                              initialRating: 0,
                              itemSize: 13,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              ratingWidget: RatingWidget(
                                full: Icon(
                                  Icons.star_rounded,
                                  color: AppColors.mainColor,
                                ),
                                half: Icon(
                                  Icons.star_half_rounded,
                                  color: AppColors.mainColor,
                                ),
                                empty: Icon(
                                  Icons.star_outline_rounded,
                                  color: AppColors.mainColor,
                                ),
                              ),
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 1.0),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
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
                          // productName ?? "shirt",
                          Localizations.localeOf(context).languageCode == "ar"
                              // ? theProduct.result.nameAr
                              // : theProduct.result.nameEn,

                              ///
                              ///

                              ? theCategoryProduct.nameAr
                              : theCategoryProduct.nameEn,

                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          // brandName != null
                          //     ? brandName!.toUpperCase()
                          //     : "chanel".toUpperCase(),

                          Localizations.localeOf(context).languageCode == "ar"
                              // ? theProduct.result.brand.nameAr
                              // : theProduct.result.brand.nameEn,
                              ///
                              ///

                              ? theCategoryProduct.brand.nameAr
                              : theCategoryProduct.brand.nameEn,
                          style: AppConstants.customTitleTextStyle.copyWith(
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        FreamWorkImage.Image.asset(
                          AppImages.chanelLogoJfif,
                          width: 12,
                          height: 12,
                        ),
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
                          // newPrice != null
                          //     ? "${S.of(context).aed} $newPrice".toUpperCase()
                          //     : "${S.of(context).aed} uk".toUpperCase(),

                          // theProduct.result.price ?? "uk",

                          theCategoryProduct.price ?? "uk",

                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),

                        // oldPrice  != null
                        //     ? Text(
                        //         oldPrice != null
                        //             ? "${S.of(context).aed} $oldPrice"
                        //                 .toUpperCase()
                        //             : "${S.of(context).aed} uk".toUpperCase(),
                        //         style:
                        //             AppConstants.customTitleTextStyle.copyWith(
                        //           fontSize: 8,
                        //           color: Colors.black,
                        //           decoration: TextDecoration.lineThrough,
                        //         ),
                        //       )
                        //     : const SizedBox(),

                        // theProduct.result.compareToPrice != null
                        ///
                        ///
                        ///

                        theCategoryProduct.compareToPrice != null
                            ? Text(
                                theCategoryProduct.compareToPrice != null
                                    ? "${S.of(context).aed} ${theCategoryProduct.compareToPrice}"
                                        .toUpperCase()
                                    : "${S.of(context).aed} uk".toUpperCase(),
                                style:
                                    AppConstants.customTitleTextStyle.copyWith(
                                  fontSize: 8,
                                  color: Colors.black,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              )
                            : const SizedBox(),

                        Spacer(),
                        Container(
                          width: 38,
                          height: 15,
                          decoration: BoxDecoration(
                            color: AppColors.mainColor.withOpacity(.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // child: Image.asset(
                          //   height: 10,
                          //   width: 510,
                          //   AppImages.cartSmallPng,
                          // ),

                          // child: Image.Image.asset(name),
                          child: FreamWorkImage.Image.network(
                            theCategoryProduct.brand.image,
                            // cacheHeight: double.infinity.toInt(),
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


// #### #### //
// #### #### //
// #### #### //
// #### #### //
// #### #### //
// #### #### //

// return TabBarView(
//                         children: [
//                           // #### all product pages #### //
//                           // if (theState.isEmpty)
//                           Center(
//                             child: AppNoData(),
//                           ),
//                           // else
//                           //   Icon(
//                           //     Icons.all_inbox_rounded,
//                           //   ),

//                           ///
//                           ///
//                           ///
//                           ///

//                           ///
//                           // #### the rest of product pages #### //
//                           // if (context
//                           //     .read<ProductOfMainCategoryBloc>()
//                           //     .productsOfACategoryResultList
//                           //     .isEmpty)

//                           // if (state is ProductsOfMainCategorySucsessState)

//                           //    Center(
//                           //     child: Text(theState[i].nameAr),

//                           // )

//                           for (int i = 0; i < theState.length; i++)
//                             Center(
//                               // child: AppNoData(),
//                               child: Text(theState[i].nameAr),
//                             )

//                           // Column(
//                           //   children: [
//                           //     const SizedBox(
//                           //       height: 10,
//                           //       width: 10,
//                           //     ),
//                           //     GridView.builder(
//                           //         shrinkWrap: true,
//                           //         gridDelegate:
//                           //             SliverGridDelegateWithFixedCrossAxisCount(
//                           //           crossAxisCount: 2,
//                           //           childAspectRatio: .6,
//                           //           crossAxisSpacing: 5,
//                           //           mainAxisSpacing: 15,
//                           //         ),
//                           //         itemBuilder: (context, index) {
//                           //           // return _ProductCard(
//                           //           //   width: 180,
//                           //           //   height: 170,
//                           //           //   withShado: true,
//                           //           //   onTap: () {
//                           //           //     navigateTo(context, UnderDevScreen());
//                           //           //   },
//                           //           //   // newPrice: 400,
//                           //           //   // productCategory: "men",
//                           //           //   // productName: "t-shirt",
//                           //           //   // ratingNumber: 3.8,                                    ,
//                           //           // );

//                           //           return const SizedBox(
//                           //             child: Icon(Icons.directions_car),
//                           //           );
//                           //         }),
//                           //   ],
//                           // )
//                           // else
//                           // for (int i = 0;
//                           //     i <theState.length;
//                           //     i++)
//                           //   Icon(Icons.directions_car),

//                           // Icon(Icons.directions_car),
//                           // Icon(Icons.directions_transit),
//                           // Icon(Icons.directions_bike),
//                           // _CustomTabChild(),
//                           // _CustomTabChild(),
//                         ],
//                       )
