// ignore_for_file: prefer_const_constructors

part of '../home_screen.dart';

class _CustomBanarLaktah extends StatelessWidget {
  final String? banarTitle, banarTag, theProductsStats;
  // final TheCollectionModel theCollectionModel; 

  const _CustomBanarLaktah({
    super.key,
    required this.banarTitle,
    required this.banarTag,
    required this.theProductsStats,
    // required this.theCollectionModel, 
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsLaktahBloc, ProductsLaktahState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  banarTitle == S.of(context).theNew
                      ? "${S.of(context).theNew} :"
                      : (banarTitle == S.of(context).theLakta
                          ? "${S.of(context).theLakta} :"
                          : (banarTitle == S.of(context).thebestSeller
                              ? "${S.of(context).thebestSeller} :"
                              : (banarTitle == S.of(context).theDiscaount
                                  ? "${S.of(context).theDiscaount} :"
                                  : ""))),
                  style: _customTitleTextStyle,
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
                    "${S.of(context).showAll}:",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              // height: 140,
              height: 290,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  // vertical: 10,
                  // horizontal: 10,
                  ),
              decoration: BoxDecoration(
                // color: AppColors.mainGreyColor.withOpacity(.1),
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),


              ////
              ///
              ///
              ///
              ///
              ///

              child: state is ProductsLaktahLoadingState
                  ? Center(
                      child: CustomLoadingScreen(),
                    )
                  : state is ProductsLaktahEmptyState
                      ? Center(
                          child: AppNoData(),
                        )
                      : (
                          // if it's loaded or error state
                          state is ProductsLaktahErrorState
                              ? ErrorScreen(
                                  errorMessage:
                                      state.errorMessage ?? "unknonErro",
                                )
                              : (state is ProductsLaktahSucsessState
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          state.newProductCollectionList.length,
                                      padding: EdgeInsets.symmetric(
                                          // horizontal: 15,
                                          ),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return ProductCard(
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
                                          // newPrice: state
                                          //             .newProductCollectionList[
                                          //                 index]
                                          //             .price !=
                                          //         null
                                          //     ? double.parse(state
                                          //         .newProductCollectionList[index]
                                          //         .price)
                                          //     : 0.0,
                                          // productCategory: globalCachedUserLang ==
                                          //         "ar"
                                          //     ? state
                                          //         .newProductCollectionList[index]
                                          //         .categories
                                          //         .first
                                          //         .category
                                          //         .nameAr
                                          //     : state
                                          //         .newProductCollectionList[index]
                                          //         .categories
                                          //         .first
                                          //         .category
                                          //         .nameEn,
                                          // productName: globalCachedUserLang ==
                                          //         "ar"
                                          //     ? state
                                          //         .newProductCollectionList[index]
                                          //         .nameAr
                                          //     : state
                                          //         .newProductCollectionList[index]
                                          //         .nameEn,
                                          // ratingNumber: 3.8,
                                          theeProductStatus: theProductsStats,
                                          theCollectionProduct: state
                                              .newProductCollectionList[index],
                                              // theStockNumber: state.theCollectionModel.result.totalCount,

theCollectionModel: state.theCollectionModel,
                                        );
                                      }

                                      //////

                                      )
                                  : const SizedBox())),
            ),
          ],
        );
      },
    );
  }
}

///////////////////
///
///
///
///
///
///////////////////

class _CustomBanarBestSeller extends StatelessWidget {
  final String? banarTitle, banarTag, theProductsStats;
  // final TheCollectionModel theCollectionModel; 

  const _CustomBanarBestSeller({
    super.key,
    required this.banarTitle,
    required this.banarTag,
    required this.theProductsStats,
    // required this.theCollectionModel, 
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBestsellerBloc, ProductsBestsellerState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  banarTitle == S.of(context).theNew
                      ? "${S.of(context).theNew} :"
                      : (banarTitle == S.of(context).theLakta
                          ? "${S.of(context).theLakta} :"
                          : (banarTitle == S.of(context).thebestSeller
                              ? "${S.of(context).thebestSeller} :"
                              : (banarTitle == S.of(context).theDiscaount
                                  ? "${S.of(context).theDiscaount} :"
                                  : ""))),
                  style: _customTitleTextStyle,
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
                    "${S.of(context).showAll}:",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              // height: 140,
              height: 290,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  // vertical: 10,
                  // horizontal: 10,
                  ),
              decoration: BoxDecoration(
                // color: AppColors.mainGreyColor.withOpacity(.1),
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),

              ////
              ///
              ///
              ///
              ///
              ///

              child: state is ProductsBestSellerLoadingState
                  ? Center(
                      child: CustomLoadingScreen(),
                    )
                  : state is ProductsBestSellerEmptyState
                      ? Center(
                          child: AppNoData(),
                        )
                      : (
                          // if it's loaded or error state
                          state is ProductsBestSellerErrorState
                              ? ErrorScreen(
                                  errorMessage:
                                      state.errorMessage ?? "unknonErro",
                                )
                              : (state is ProductsBestSellerSucsessState
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: state
                                          .bestSellerCollectionProductList
                                          .length,
                                      padding: EdgeInsets.symmetric(
                                          // horizontal: 15,
                                          ),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return ProductCard(
                                          width: 180,
                                          height: 170,
                                          withShado: true,
                                          // onTap: () {
                                          //   navigateTo(context,
                                          //       ProductDetailsScreen());
                                          //   // and then pass the product of state.newProductsList[index]
                                          // },
                                          // newPrice: state
                                          //             .newProductCollectionList[
                                          //                 index]
                                          //             .price !=
                                          //         null
                                          //     ? double.parse(state
                                          //         .newProductCollectionList[index]
                                          //         .price)
                                          //     : 0.0,
                                          // productCategory: globalCachedUserLang ==
                                          //         "ar"
                                          //     ? state
                                          //         .newProductCollectionList[index]
                                          //         .categories
                                          //         .first
                                          //         .category
                                          //         .nameAr
                                          //     : state
                                          //         .newProductCollectionList[index]
                                          //         .categories
                                          //         .first
                                          //         .category
                                          //         .nameEn,
                                          // productName: globalCachedUserLang ==
                                          //         "ar"
                                          //     ? state
                                          //         .newProductCollectionList[index]
                                          //         .nameAr
                                          //     : state
                                          //         .newProductCollectionList[index]
                                          //         .nameEn,
                                          // ratingNumber: 3.8,
                                          theeProductStatus: theProductsStats,
                                          theCollectionProduct: state
                                                  .bestSellerCollectionProductList[
                                              index],

                                              // theStockNumber: state.theCollectionModel.result.totalCount,

theCollectionModel: state.theCollectionModel,
                                        );
                                      }

                                      //////

                                      )
                                  : const SizedBox())),
            ),
          ],
        );
      },
    );
  }
}

///////////////////
///
///
///
///
///
///////////////////

class _CustomBanarNew extends StatelessWidget {
  final String? banarTitle, banarTag, theProductsStats;
  // final int? theStockNumber;
  // final TheCollectionModel theCollectionModel; 

  const _CustomBanarNew({
    super.key,
    required this.banarTitle,
    required this.banarTag,
    required this.theProductsStats,
    // required this.theStockNumber, 

    // required this.theCollectionModel, 
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsNewBloc, ProductsNewState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  banarTitle == S.of(context).theNew
                      ? "${S.of(context).theNew} :"
                      : (banarTitle == S.of(context).theLakta
                          ? "${S.of(context).theLakta} :"
                          : (banarTitle == S.of(context).thebestSeller
                              ? "${S.of(context).thebestSeller} :"
                              : (banarTitle == S.of(context).theDiscaount
                                  ? "${S.of(context).theDiscaount} :"
                                  : ""))),
                  style: _customTitleTextStyle,
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "${S.of(context).showAll}:",
                    style: _customTitleTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.mainColor),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              // height: 140,
              height: 290,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  // vertical: 10,
                  // horizontal: 10,
                  ),
              decoration: BoxDecoration(
                // color: AppColors.mainGreyColor.withOpacity(.1),
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),


              ////
              ///
              ///
              ///
              ///
              ///

              child: state is ProductsNewLoadingState
                  ? Center(
                      child: CustomLoadingScreen(),
                    )
                  : state is ProductsNewEmptyState
                      ? Center(
                          child: AppNoData(),
                        )
                      : (
                          // if it's loaded or error state
                          state is ProductsNewErrorState
                              ? ErrorScreen(
                                  errorMessage:
                                      state.errorMessage ?? "unknonErro",
                                )
                              : (state is ProductsNewSucsessState
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          state.newProductCollectionList.length,
                                      padding: EdgeInsets.symmetric(
                                          // horizontal: 15,
                                          ),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return ProductCard(
                                          
                                          width: 180,
                                          height: 170,
                                          withShado: true,
                                          // onTap: () {
                                          //   navigateTo(context,
                                          //       ProductDetailsScreen());
                                          //   // and then pass the product of state.newProductsList[index]
                                          // },
                                          // newPrice: state
                                          //             .newProductCollectionList[
                                          //                 index]
                                          //             .price !=
                                          //         null
                                          //     ? double.parse(state
                                          //         .newProductCollectionList[index]
                                          //         .price)
                                          //     : 0.0,
                                          // productCategory: globalCachedUserLang ==
                                          //         "ar"
                                          //     ? state
                                          //         .newProductCollectionList[index]
                                          //         .categories
                                          //         .first
                                          //         .category
                                          //         .nameAr
                                          //     : state
                                          //         .newProductCollectionList[index]
                                          //         .categories
                                          //         .first
                                          //         .category
                                          //         .nameEn,
                                          // productName: globalCachedUserLang ==
                                          //         "ar"
                                          //     ? state
                                          //         .newProductCollectionList[index]
                                          //         .nameAr
                                          //     : state
                                          //         .newProductCollectionList[index]
                                          //         .nameEn,
                                          // ratingNumber: 3.8,
                                          theeProductStatus: theProductsStats,
                                          theCollectionProduct: state
                                              .newProductCollectionList[index],
                                              
                                              // theStockNumber: state.theCollectionModel.result.totalCount,
                                              theCollectionModel: state.theCollectionModel,

                                      );
                                      }

                                      //////

                                      )

                                  // ? Container(
                                  //     width: double.infinity,
                                  //     height: 200,
                                  //     color: Colors.amberAccent,
                                  //   )
                                  : Container(
                                      width: double.infinity,
                                      height: 200,
                                      color: Colors.red,
                                    ))),
            ),
          ],
        );
      },
    );
  }
}

///////////////////
///
///
///
///
///
///////////////////

class _CustomBanarDisscount extends StatelessWidget {
  final String? banarTitle, banarTag, theProductsStats;
  // final TheCollectionModel theCollectionModel; 

  const _CustomBanarDisscount({
    super.key,
    required this.banarTitle,
    required this.banarTag,
    required this.theProductsStats,
    // required this.theCollectionModel, 
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsDiscountsBloc, ProductsDiscountsState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  banarTitle == S.of(context).theNew
                      ? "${S.of(context).theNew} :"
                      : (banarTitle == S.of(context).theLakta
                          ? "${S.of(context).theLakta} :"
                          : (banarTitle == S.of(context).thebestSeller
                              ? "${S.of(context).thebestSeller} :"
                              : (banarTitle == S.of(context).theDiscaount
                                  ? "${S.of(context).theDiscaount} :"
                                  : ""))),
                  style: _customTitleTextStyle,
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
                    "${S.of(context).showAll}:",
                    style: _customTitleTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.mainColor),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              // height: 140,
              height: 290,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  // vertical: 10,
                  // horizontal: 10,
                  ),
              decoration: BoxDecoration(
                // color: AppColors.mainGreyColor.withOpacity(.1),
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),

              child: state is ProductsDiscountLoadingState
                  ? Center(
                      child: CustomLoadingScreen(),
                    )
                  : state is ProductsDiscountEmptyState
                      ? Center(
                          child: AppNoData(),
                        )
                      : (
                          // if it's loaded or error state
                          state is ProductDiscountErrorState
                              ? ErrorScreen(
                                  errorMessage:
                                      state.errorMessage ?? "unknonErro",
                                )
                              : (state is ProductsDiscountSucsessState
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          state.newProductCollectionList.length,
                                      padding: EdgeInsets.symmetric(
                                          // horizontal: 15,
                                          ),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return ProductCard(
                                          width: 180,
                                          height: 170,
                                          withShado: true,
                                          theeProductStatus: theProductsStats,
                                          // theProduct: state
                                          //     .newProductCollectionList[index].productStatus[0].status,
                                          theCollectionProduct: state
                                              .newProductCollectionList[index],

                                              // theStockNumber: state.theCollectionModel.result.totalCount,

                                              theCollectionModel: state.theCollectionModel,

                                      );

                                        // return Container(
                                        //   color: Colors.amber,
                                        //   height: 100,
                                        //   width: 100,
                                        //   margin: EdgeInsets.all(10),
                                        // );
                                      }

                                      //////

                                      )
                                  : const SizedBox())),
            ),
          ],
        );
      },
    );
  }
}
