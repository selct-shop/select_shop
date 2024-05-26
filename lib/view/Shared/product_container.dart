// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';

// const String _productNmae = "men shirt";
const String _discountOrNewTag = "disscount";
// const String _ProductDiscription =
//     "product discription, product discription, product discription, product discription, product discription, product discription, ";
// const String _ProductOldPrice = "120";
// const String _ProductNewPrice = "97";
// const String _brandName = "chanel";

class ProductContainer extends StatelessWidget {
  final bool? isDisscountOrNew, isFavourated, isDiscountOrNew, hasPaddings;
  final String? productName,
      categoryName,
      productDiscreption,
      oldPrice,
      newPrice,
      brandName,
      productNetworkImage,
      brandNetworkImage;
  final double? productRating, width, height;
  final Function()? onTapProductWidget, onTapAddOrRemoveFav;
  const ProductContainer({
    super.key,
    required this.isDisscountOrNew,
    required this.isFavourated,
    required this.isDiscountOrNew,
    required this.hasPaddings,
    required this.productName,
    required this.categoryName,
    required this.productDiscreption,
    required this.oldPrice,
    required this.newPrice,
    required this.brandName,
    required this.productNetworkImage,
    required this.brandNetworkImage,
    required this.productRating,
    this.width,
    this.height,
    required this.onTapProductWidget,
    required this.onTapAddOrRemoveFav,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: hasPaddings == true ? 20 : 0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTapProductWidget ?? () {},
        child: Container(
          width: width ?? double.infinity,
          height: 134,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.mainGreyColor.withOpacity(.3),
                blurRadius: 5,
                offset: Offset(3, 3),
              ),
              BoxShadow(
                color: AppColors.mainGreyColor.withOpacity(.3),
                blurRadius: 5,
                offset: Offset(-3, -1),
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
                    isFavourated: isFavourated ?? false,
                    isDiscountOrNew: isDiscountOrNew ?? false,
                    addOrRemoveFav: onTapAddOrRemoveFav ?? () {},
                  ),
                  _NameAndRatingRow(
                    productName: productName,
                    ratingNumber: productRating,
                  ),
                  _CategoryNameRow(),
                  _DescriptionRow(
                    productDiscription: productDiscreption ??
                        "here comes the product discription, and so on",
                  ),
                  _PriceAndBrandRow(
                    bandName: brandName ?? "brand",
                    newPrice: newPrice ?? "??",
                    oldPrice: oldPrice ?? "??",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              )),
              const SizedBox(
                width: 15,
              ),
              Container(
                width: 120,
                height: double.infinity,
                clipBehavior: Clip.hardEdge,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(AppImages.mainCarouselSlider),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryNameRow extends StatelessWidget {
  const _CategoryNameRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          Text(
            "${S.of(context).category}: ",
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            "men",
            style: TextStyle(fontSize: 10, color: AppColors.mainColor),
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Center(
              child: Text(
                productDiscription ?? "",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.grey2Color,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}

class _PriceAndBrandRow extends StatelessWidget {
  final String? bandName, oldPrice, newPrice;
  const _PriceAndBrandRow({
    super.key,
    required this.bandName,
    required this.oldPrice,
    required this.newPrice,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          // width: 35,
                          // height: 10,
                          child: Expanded(
                            child: Center(
                              child: Text(
                                // old product price

                                "$oldPrice AED",
                                // overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    height: .9,
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.greyColor),
                              ),
                            ),
                          ),
                        ),

                        //
                        //

                        SizedBox(
                          // width: 35,
                          // height: 25,
                          child: Expanded(
                            child: Center(
                              child: Text(
                                // AED

                                "AED",
                                // overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    height: .8,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: AppColors.mainColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      // new product price
                      // width: 35,
                      // height: 25,
                      child: Text(
                        // price

                        newPrice ?? "",
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            height: .8,
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.mainColor),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Spacer(),
          SizedBox(

              // brand image
              height: 15,
              width: 25,
              child: Image.asset(
                fit: BoxFit.cover,
                AppImages.chanelLogoJfif,
              )),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            // brand name
            height: double.infinity,
            width: 55,
            child: Expanded(
              child: Center(
                child: Text(
                  bandName ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppColors.mainColor),
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   width: 10,
          // ),
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
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 4,
                  child: SizedBox(
                    height: 18,
                    // width: 90,
                    child: Expanded(
                      child: Text(
                        // textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          height: .8,
                        ),
                        productName ?? " ",
                      ),
                    ),
                  ),
                ),

                // Spacer(),
                Flexible(
                  flex: 6,
                  child: SizedBox(
                    // width: 90,
                    height: 15,
                    child: Row(
                      children: [
                        Spacer(),
                        // ratingNumber != null || ratingNumber != "" ?
                        // for (int i = 1; i <= int.parse(ratingNumber!); i++)
                        //   Icon(
                        //       color: AppColors.mainColor,
                        //       size: 18,
                        //       Icons.star_rate_rounded),

                        // ratingNumber != null || ratingNumber != "" || ratingNumber !=" "  ?

                        RatingBar(
                          glow: false,
                          ignoreGestures: true,
                          initialRating: ratingNumber ?? 0,
                          itemSize: 25,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                            full: Icon(
                              Icons.star_rounded,
                              color: AppColors.mainColor,
                              size: 5,
                            ),
                            half: Icon(
                              Icons.star_half_rounded,
                              color: AppColors.mainColor,
                              size: 5,
                            ),
                            empty: Icon(
                              Icons.star_outline_rounded,
                              color: AppColors.mainColor,
                              size: 5,
                            ),
                          ),
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          onRatingUpdate: (rating) {
                            // print(rating);
                          },
                        ),
                      ],
                    ),
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
  const _TagAndFavRow({
    super.key,
    required this.isDiscountOrNew,
    required this.isFavourated,
    required this.addOrRemoveFav,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              isDiscountOrNew == true
                  ? Container(
                      // tag for disscount or new
                      alignment: Alignment.center,
                      width: 60,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          )),
                      child: Text(
                        _discountOrNewTag,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              isFavourated == true
                  ? InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: addOrRemoveFav,
                      child: SvgPicture.asset(
                        width: 20,
                        height: 20,
                        AppImagesSvg.favourFilledSvg,
                      ),
                    )
                  : InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: addOrRemoveFav,
                      child: SvgPicture.asset(
                        width: 20,
                        height: 20,
                        AppImagesSvg.favourtsStorkSvg,
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
