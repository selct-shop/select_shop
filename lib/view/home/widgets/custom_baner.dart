// ignore_for_file: prefer_const_constructors

part of '../home_screen.dart';

class _CustomBanar extends StatelessWidget {
  final String? banarTitle, banarTag, theProductsStats;

  const _CustomBanar({
    super.key,
    required this.banarTitle,
    required this.banarTag,
    required this.theProductsStats,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNewProductsBloc, GetNewProductsState>(
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

              // child: context.read<HomeBloc>().loadingNewProducts == true
              //     ? Center(
              //         child: CustomLoadingScreen(),
              //       )
              //     : context.read<HomeBloc>().newCollctionProductsList.isEmpty
              //         ? Center(
              //             child: AppNoData(),
              //           )
              //         : ListView.builder(
              //             shrinkWrap: true,
              //             itemCount: context
              //                 .read<HomeBloc>()
              //                 .newCollctionProductsList
              //                 .length,
              //             padding: EdgeInsets.symmetric(
              //                 // horizontal: 15,
              //                 ),
              //             scrollDirection: Axis.horizontal,
              //             itemBuilder: (context, index) {
              //               return ProductCard(
              //                 width: 180,
              //                 height: 170,
              //                 withShado: true,
              //                 onTap: () {
              //                   navigateTo(context, ProductDetailsScreen());
              //                 },
              //                 newPrice: context
              //                             .read<HomeBloc>()
              //                             .newCollctionProductsList[index]
              //                             .price !=
              //                         null
              //                     ? double.parse(context
              //                         .read<HomeBloc>()
              //                         .newCollctionProductsList[index]
              //                         .price)
              //                     : 0.0,
              //                 productCategory: globalCachedUserLang == "ar"
              //                     ? context
              //                         .read<HomeBloc>()
              //                         .newCollctionProductsList[index]
              //                         .categories
              //                         .first
              //                         .category
              //                         .nameAr
              //                     : context
              //                         .read<HomeBloc>()
              //                         .newCollctionProductsList[index]
              //                         .categories
              //                         .first
              //                         .category
              //                         .nameEn,
              //                 productName: globalCachedUserLang == "ar"
              //                     ? context
              //                         .read<HomeBloc>()
              //                         .newCollctionProductsList[index]
              //                         .nameAr
              //                     : context
              //                         .read<HomeBloc>()
              //                         .newCollctionProductsList[index]
              //                         .nameEn,
              //                 // ratingNumber:  context.read<HomeBloc>().newCollctionProductsList[index].productAttributes.first.,
              //                 ratingNumber: 3.8,
              //               );
              //             }

              //             //////

              //             // children: [
              //             //   for (int i = 0; i < 10; i++)
              //             //     ProductCard(
              //             //       width: 180,
              //             //       height: 170,
              //             //       withShado: true,
              //             //       onTap: () {
              //             //         Navigator.push(context,
              //             //             MaterialPageRoute(builder: (context) {
              //             //           return UnderDevScreen();
              //             //         }));
              //             //       },
              //             //       newPrice: 400,
              //             //       productCategory: "men",
              //             //       productName: "t-shirt",
              //             //       ratingNumber: 3.8,
              //             //     ),
              //             // ],
              //             ),

              ////
              ///
              ///
              ///
              ///
              ///

              child: state is GetNewProductsLoadingState
                  ? Center(
                      child: CustomLoadingScreen(),
                    )
                  : state is GetNewProductEmptyState
                      ? Center(
                          child: AppNoData(),
                        )
                      : (
                          // if it's loaded or error state
                          state is GetNewProductErrorState
                              ? ErrorScreen(
                                  errorMessage:
                                      state.errorMessage ?? "unknonErro",
                                )
                              : (state is GetNewProductLoadedState
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
                                          onTap: () {
                                            navigateTo(context,
                                                ProductDetailsScreen());
                                            // and then pass the product of state.newProductsList[index]
                                          },
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
                                          theeProductStates: theProductsStats,
                                          theProduct: state
                                              .newProductCollectionList[index],
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
