// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// part of '../cart_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/view/cart/model/cart_model.dart';
import 'package:select_shop/view/product%20details%20genral/product_details_genral_screen.dart';

const String _discountOrNewTag = "discount";

class ProductCart extends StatelessWidget {
  final CartItem cartItem;
  final CartModel cartModel;

  const ProductCart({
    super.key,
    required this.cartItem,
    required this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          navigateTo(
            context,
            ProductDetailsGenralScreen(
              productId: cartItem.productAttribute.productId,
              cartItem: cartItem,
              cartModel: cartModel,
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: 134,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.mainGreyColor.withOpacity(.3),
                blurRadius: 1,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _TagAndFavRow(
                      isFavourated: true,
                      isDiscountOrNew: true,
                      addOrRemoveFav: () {},
                      quantity: cartItem.quantity != null
                          ? cartItem.quantity.toString()
                          : "un k",
                    ),
                    _NameAndRatingRow(
                      productName: Localizations.localeOf(context).languageCode == "ar"
                          ? cartItem.productAttribute.product.nameAr
                          : cartItem.productAttribute.product.nameEn,
                      ratingNumber: 4.8,
                    ),
                    _CategoryNameRow(
                      cateName: Localizations.localeOf(context).languageCode == "ar"
                          ? cartItem.productAttribute.product.brand.nameAr
                          : cartItem.productAttribute.product.brand.nameEn,
                    ),
                    _DescriptionRow(
                      productDiscription: Localizations.localeOf(context).languageCode == "ar"
                          ? cartItem.productAttribute.product.descriptionAr
                          : cartItem.productAttribute.product.descriptionEn ??
                              "here comes the product description, and so on",
                    ),
                    _PriceAndBrandRow(
                      bandName: Localizations.localeOf(context).languageCode == "ar"
                          ? cartItem.productAttribute.product.brand.nameAr
                          : cartItem.productAttribute.product.brand.nameEn,
                      newPrice: cartItem.productAttribute.product.price ?? "??",
                      oldPrice: cartItem.productAttribute.product.compareToPrice ?? "??",
                      brandImage: cartItem.productAttribute.product.brand.image,
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Container(
                width: 120,
                height: double.infinity,
                clipBehavior: Clip.hardEdge,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(cartItem.productAttribute.product.mainImages),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryNameRow extends StatelessWidget {
  final String? cateName;
  
  const _CategoryNameRow({
    super.key,
    required this.cateName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15,
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Text(
            "${S.of(context).category}: ",
            style: const TextStyle(fontSize: 10),
          ),
          Text(
            cateName ?? "uk",
            style: const TextStyle(fontSize: 10, color: AppColors.mainColor),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _DescriptionRow extends StatelessWidget {
  final String? productDiscription;
  
  const _DescriptionRow({
    super.key,
    required this.productDiscription,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18,
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: Center(
              child: Text(
                productDiscription ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.grey2Color,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
        ],
      ),
    );
  }
}

class _PriceAndBrandRow extends StatelessWidget {
  final String? bandName, oldPrice, newPrice, brandImage;
  
  const _PriceAndBrandRow({
    super.key,
    required this.bandName,
    required this.oldPrice,
    required this.newPrice,
    required this.brandImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Row(
            children: [
              SizedBox(
                width: 120,
                height: 35,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              "$oldPrice AED",
                              style: const TextStyle(
                                height: .9,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                color: AppColors.greyColor,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "AED",
                              style: const TextStyle(
                                height: .8,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColors.mainColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 5),
                    Text(
                      newPrice ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        height: .8,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Spacer(),
          Image(
            height: 15,
            width: 25,
            image: NetworkImage(brandImage ?? AppConstants.cachedRandomeNetworkImage),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Center(
              child: Text(
                bandName ?? "",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppColors.mainColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NameAndRatingRow extends StatelessWidget {
  final String? productName;
  final double? ratingNumber;
  
  const _NameAndRatingRow({
    super.key,
    required this.productName,
    required this.ratingNumber,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18,
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 6,
                  child: Text(
                    productName ?? " ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      height: .8,
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: RatingBar(
                    glow: false,
                    ignoreGestures: true,
                    initialRating: ratingNumber ?? 0,
                    itemSize: 15,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: Icon(Icons.star_rounded, color: AppColors.mainColor, size: 3),
                      half: Icon(Icons.star_half_rounded, color: AppColors.mainColor, size: 3),
                      empty: Icon(Icons.star_outline_rounded, color: AppColors.mainColor, size: 3),
                    ),
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                    onRatingUpdate: (rating) {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TagAndFavRow extends StatelessWidget {
  final bool? isDiscountOrNew, isFavourated;
  final Function()? addOrRemoveFav;
  final String? quantity;

  const _TagAndFavRow({
    super.key,
    required this.isDiscountOrNew,
    required this.isFavourated,
    required this.addOrRemoveFav,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Row(
        children: [
          if (isDiscountOrNew == true)
            Container(
              alignment: Alignment.center,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              child: Text(
                _discountOrNewTag,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "${S.of(context).quantity}: ",
                    style: const TextStyle(fontSize: 10, color: AppColors.mainColor),
                  ),
                  Text(
                    quantity ?? "uk",
                    style: const TextStyle(fontSize: 10, color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: addOrRemoveFav,
                child: SvgPicture.asset(
                  width: 20,
                  height: 20,
                  isFavourated == true
                      ? AppImagesSvg.favourFilledSvg
                      : AppImagesSvg.favourtsStorkSvg,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}






// class _TagAndFavRow extends StatelessWidget {
//   final bool? isDiscountOrNew, isFavourated;
//   final Function()? addOrRemoveFav;
//   final String? quantity;
//   const _TagAndFavRow({
//     super.key,
//     required this.isDiscountOrNew,
//     required this.isFavourated,
//     required this.addOrRemoveFav,
//     required this.quantity,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 30,
//       width: double.infinity,
//       child: Expanded(
//         child: Row(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 SizedBox(
//                   width: double.infinity,
//                   height: 25,
//                   child: Row(
//                     children: [
//                       isDiscountOrNew == true
//                           ? Container(
//                               // tag for disscount or new
//                               alignment: Alignment.center,
//                               // width: 60,
//                               height: 25,
//                               decoration: BoxDecoration(
//                                   color: Colors.blue,
//                                   borderRadius: BorderRadius.only(
//                                     bottomRight: Radius.circular(10),
//                                     topLeft: Radius.circular(10),
//                                   )),
//                               child: Text(
//                                 _discountOrNewTag,
//                                 style: TextStyle(
//                                     fontSize: 12, color: Colors.white),
//                               ),
//                             )
//                           : const SizedBox(),
//                       Expanded(
//                         child: SizedBox(
//                           height: 15,
//                           width: double.infinity,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 "${S.of(context).Quantity}: ",
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                 ),
//                               ),
//                               Text(
//                                 quantity ?? "uk",
//                                 style: TextStyle(
//                                     fontSize: 10, color: AppColors.mainColor),
//                               ),
//                               const Spacer(),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             // const Spacer(),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 isFavourated == true
//                     ? InkWell(
//                         borderRadius: BorderRadius.circular(50),
//                         onTap: addOrRemoveFav,
//                         child: SvgPicture.asset(
//                           width: 20,
//                           height: 20,
//                           AppImagesSvg.favourFilledSvg,
//                         ),
//                       )
//                     : InkWell(
//                         borderRadius: BorderRadius.circular(50),
//                         onTap: addOrRemoveFav,
//                         child: SvgPicture.asset(
//                           width: 20,
//                           height: 20,
//                           AppImagesSvg.favourtsStorkSvg,
//                         ),
//                       ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
