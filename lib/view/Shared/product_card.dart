// #### ProductCard #### //

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/main.dart';
import 'package:select_shop/models/collection/the_collection_modle.dart';
import 'package:flutter/src/widgets/image.dart' as FreamWorkImage;
import 'package:select_shop/models/the%20product/the_product_modle.dart';
import 'package:select_shop/view/product%20details/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  // final void Function()? onTap;
  final double? height, width;
  // final double? ratingNumber, newPrice, oldPrice;
  // final String? productCategory, productName, brandName;
  // i use this shadow to give it card affect, and it's defalt true
  final bool? withShado;
  final String? theeProductStatus;
  // final TheProductModel theProduct;
  final TheCollectionProduct theCollectionProduct;

  ProductCard({
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
    required this.theCollectionProduct,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
      onTap: () {
        // navigateTo(context,
        // ProductDetailsScreen(theProductModle: theProduct)
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
                            theCollectionProduct.mainImages

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

                              ? theCollectionProduct
                                  .categories[0].category.nameAr
                              : theCollectionProduct
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

                              ? theCollectionProduct.nameAr
                              : theCollectionProduct.nameEn,

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

                              ? theCollectionProduct.brand.nameAr
                              : theCollectionProduct.brand.nameEn,
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

                          theCollectionProduct.price ?? "uk",

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

                        theCollectionProduct.compareToPrice != null
                            ? Text(
                                theCollectionProduct.compareToPrice != null
                                    ? "${S.of(context).aed} ${theCollectionProduct.compareToPrice}"
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
                            theCollectionProduct.brand.image,
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
