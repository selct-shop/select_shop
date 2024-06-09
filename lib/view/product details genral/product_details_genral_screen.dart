// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/main.dart';
// import 'package:select_shop/models/collection/get_collection_modle.dart';
// import 'package:select_shop/models/the%20product/the_product_modle.dart';
import 'package:select_shop/view/Shared/app_button.dart';
import 'package:select_shop/view/Shared/loading_screen.dart';
import 'package:select_shop/view/cart/model/cart_model.dart';
import 'package:select_shop/view/check%20out/check_out_screen.dart';
import 'package:select_shop/view/product%20details%20genral/prod%20deta%20gen%20bloc/prod%20calcu%20bloc/prod_calcu_bloc.dart';

// Key prodcutImageKey = key();
TextStyle _customTitleTextStyle = TextStyle(
  color: AppColors.grey2Color,
  height: .7,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);
TextStyle _customBodyTextStyle = TextStyle(
  color: AppColors.grey2Color,
  // height: .8,
  height: 1.2,

  // fontWeight: FontWeight.bold,
  fontSize: 16,
);
TextStyle _customDropdownlistItemTextStyle = TextStyle(
  color: AppColors.mainColor,
  fontWeight: FontWeight.bold,
  fontSize: 20,
  height: .5,
);

class ProductDetailsGenralScreen extends StatefulWidget {
  // final CollectionProduct theCollectionProductModle;
  // final TheProductModle theProductModle;
  final CartItem cartItem;
  final int productId;
  final CartModel cartModel;
  const ProductDetailsGenralScreen({
    super.key,
    // required this.theProductModle,
    // required this.theCollectionProductModle,
    required this.cartItem,
    required this.productId,
    required this.cartModel,
  });

  @override
  State<ProductDetailsGenralScreen> createState() =>
      _ProductDetailsGenralScreenState();
}

class _ProductDetailsGenralScreenState
    extends State<ProductDetailsGenralScreen> {
  @override
  void initState() {
    // TODO: implement initState

    // print(cartItem.productAttribute.product.id )

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            _ProductPicticher(
              imageCartProductList: widget.cartItem.productAttribute.images,
            ),
            _Body(
              productID: widget.productId,
              cartItem: widget.cartItem,
              cartModel: widget.cartModel,
            ),
          ],
        ),
      )),
    );
  }
}

class _Body extends StatelessWidget {
  final int? productID;
  final CartModel cartModel; 

  final CartItem cartItem;

  const _Body({
    super.key,
    required this.productID,
    required this.cartItem,
    required this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // _TitleRow(
              //   oldPrice: "120",
              //   newPrice: "199",
              // ),

              _TitleRow(
                oldPrice: cartItem.productAttribute.product.compareToPrice
                        .toString() ??
                    "uk",
                newPrice:
                    cartItem.productAttribute.product.price.toString() ?? "uk",
                theImageLink: cartItem.productAttribute.product.brand.image,
                productName:
                    Localizations.localeOf(context).languageCode == "ar"
                        ? cartItem.productAttribute.product.nameAr
                        : cartItem.productAttribute.product.nameEn,
                brandName: Localizations.localeOf(context).languageCode == "ar"
                    ? cartItem.productAttribute.product.brand.nameAr
                    : cartItem.productAttribute.product.brand.nameEn,
              ),

              const SizedBox(
                height: 5,
              ),
              _RatingWidget(
                // ratingNumber: 3.5,
                // productID: productID!.toDouble(),
                productID: cartItem.productAttribute.product.id.toDouble(),
              ),
              // const SizedBox(
              //   height: 5,
              // ),

              // _CategoryDiscriptionRow(
              //   catigoryDiscription: "men",
              // ),

              // _CategoryDiscriptionRow(
              //               catigoryDiscription:
              //                   Localizations.localeOf(context).languageCode == "ar"
              //                       ? cartItem.productAttribute.product.brand.merchant.buisnessCategory
              //                       // : theCollectionProduct.categories[0].category.nameEn,
              //                       : cartItem.productAttribute.product.brand.merchant.buisnessCategory,
              //             ),

              _DiscriptionRow(
                  discription:
                      Localizations.localeOf(context).languageCode == "ar"
                          ? cartItem.productAttribute.product.descriptionAr
                          : cartItem.productAttribute.product.descriptionEn),

              if (cartItem.productAttribute.product.productType ==
                      "onlyColors" ||
                  cartItem.productAttribute.product.productType ==
                      "colorsAndProps")
                _ColorRow(
                  theColor: cartItem.productAttribute.color.value,
                ),

              if (cartItem.productAttribute.product.productType ==
                      "onlyProps" ||
                  cartItem.productAttribute.product.productType ==
                      "colorsAndProps")
                _SizeRow(
                  // isActive: true,
                  propValue: cartItem.productAttribute.propValue,
                ),

              // _NumberOfStock(
              //   stockNumber: 20.toString(),
              // ),
            ],
          ),
        ),
        Container(
          color: AppColors.greyColor.withOpacity(.3),
          width: double.infinity,
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              _ShipmentTitleRow(),
              _CustomShipmentListTile(
                discription: S.of(context).fastShipment,
                // discription:
                // "free returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree return",
                svgImgName: AppImagesSvg.truckSvg,
                onTap: () {},
                haveDivider: true,
              ),
              _CustomShipmentListTile(
                discription: S.of(context).paymentOnRecive,
                // discription:
                // "free returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree return",
                svgImgName: AppImagesSvg.cashSvg,
                onTap: () {},
                haveDivider: true,
              ),
              _CustomShipmentListTile(
                discription: S.of(context).freeReturn,
                // discription:
                // "free returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree return",
                svgImgName: AppImagesSvg.returnSvg,
                onTap: () {},
                haveDivider: true,
              ),
              _CustomShipmentListTile(
                discription: S.of(context).earnFreePoints,
                // discription:
                // "free returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree returnfree return",
                svgImgName: AppImagesSvg.giftSvg,
                onTap: () {},
                // haveDivider: true,
              ),
            ],
          ),
        ),
        Container(
          color: AppColors.greyColor.withOpacity(.3),
          width: double.infinity,
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              _ComentsTitleRow(),

              const SizedBox(
                height: 5,
              ),

              ///
              ///
              ///
              ///

              _RatingContainer(
                ratingNumber: 4.55,
                theRatingQuestion: "is the size good",
              ),

              const SizedBox(
                height: 10,
              ),

              _RandomUserComment(
                theRandomeUserComment:
                    "honslly it's very great product, i really convince you to buy it, without thinking",
              ),

              // Divider(

              //   color: AppColors.greyColor.withOpacity(opacity),
              // ),

              // const SizedBox(
              //   height: 10,
              // ),
            ],
          ),
        ),
        Container(
          // costom divider
          color: AppColors.greyColor.withOpacity(.3),
          width: double.infinity,
          height: 1,
        ),
        _NavigateToAllCommentsWidget(),
        Container(
          color: AppColors.greyColor.withOpacity(.3),
          width: double.infinity,
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: _BrandNameAndDetialsWidget(
            theImageUrl: cartItem.productAttribute.product.brand.image,
            theBrandName: Localizations.localeOf(context).languageCode == "ar"
                ? cartItem.productAttribute.product.brand.nameAr
                : cartItem.productAttribute.product.brand.nameEn,
            // theNumberOfProducts: 342.0,
          ),
        ),
        Container(
          color: AppColors.greyColor.withOpacity(.3),
          width: double.infinity,
          height: 8,
        ),

        ///
        ///
        ///

//         Container(
//           // ( add to cart, fav ) Row
//           height: 135,
//           width: double.infinity,
//           padding: EdgeInsets.symmetric(
//             horizontal: 10,
//             vertical: 20,
//           ),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(20),
//               bottomRight: Radius.circular(20),
//             ),
//             boxShadow: AppConstants.theBoxShdow,
//           ),
//           child: Row(
//             // add to cart row
//             children: [
//               // SizedBox(
//               //   width: 60,
//               //   height: 45,
//               //   child: InkWell(
//               //     // borderRadius: BorderRadius.circular(10),
//               //     onTap: () {
//               //       // add the product to favourets
//               //     },
//               //     child: Container(
//               //       width: 60,
//               //       height: 45,
//               //       decoration: BoxDecoration(
//               //         borderRadius: BorderRadius.circular(10),
//               //         border: Border.all(color: AppColors.mainColor),
//               //       ),
//               //       child: SvgPicture.asset(
//               //         AppImages.favNotFilled,
//               //         color: AppColors.mainColor,
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               // AppButton(
//               //   title: "add to cart",
//               //   onTap: () {
//               //     // add to cart and navigate to cart
//               //   },
//               //   backgroundColor: AppColors.mainColor,
//               //   textColor: Colors.white,
//               //   height: 45,
//               //   width: double.infinity,
//               //   borderRadius: 10,
//               // ),

// //  _BrandNameAndDetialsWidget(
// //             theBrandName:
// //                 "chanel chanel chanel chanel chanel chanel chanel chanel chanel chanel chanel chanel chanel chanel chanel chanel chanel ",
// //             theNumberOfProducts: 342.0,
// //           ),

//               InkWell(
//                 onTap: () {},
//                 child: Container(
//                   height: 45,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: AppColors.mainColor,
//                     borderRadius: AppConstants.theNewBorderRadius,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),

//         ///
//         ///
//         ///

//         const SizedBox(
//           height: 100,
//         ),

        ///
        ///
        ///
        ///
        ///

        _AddToCartAndFavRow(cartModel: cartModel,),

        const SizedBox(
          height: 45,
        ),

        // Container(
        //   width: double.infinity,
        //   height: 135,

        //   // padding: EdgeInsets.symmetric(
        //   //   horizontal: 10,
        //   //   vertical: 20,
        //   // ),

        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.only(
        //       bottomLeft: Radius.circular(20),
        //       bottomRight: Radius.circular(20),
        //     ),
        //     // boxShadow: [
        //     //   BoxShadow(
        //     //       blurRadius: 3,
        //     //       color: AppColors.greyColor.withOpacity(.3),
        //     //       offset: Offset(3, 6)),
        //     // ],
        //     boxShadow: AppConstants.theBoxShdow,
        //   ),
        // ),

        ///
        ///
        ///
        ///
      ],
    );
  }
}

class _AddToCartAndFavRow extends StatelessWidget {
  // final CollectionProduct theProductModle;
  final CartModel cartModel;

  _AddToCartAndFavRow({
    super.key,
    //  required  this.theProductModle,
    required this.cartModel
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // ( add to cart, fav ) Row

      // width: double.infinity,
      width: MediaQuery.of(context).size.width,
      height: 135,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 3,
              color: AppColors.greyColor.withOpacity(.3),
              offset: Offset(3, 6)),
        ],
        // boxShadow: AppConstants.theBoxShdow,
      ),

      child: SizedBox(
        // width: double.infinity,
        width: MediaQuery.of(context).size.width,

        height: 45,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                   onTap: () => navigateTo(
                context,
                CheckOutScreen(
                  cartModel: cartModel,
                )),
                  child: Center(
                    child: Text(
                      S.of(context).checkOut,
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
//             SizedBox(
//               height: 10,
//               width: 10,
//             ),
//             Container(
//               width: 55,
//               // width: 100,

//               height: 45,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 12.5,
//               ),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: AppColors.mainColor,
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//               ),
//               child: InkWell(
//                 borderRadius: BorderRadius.circular(10),
//                 onTap: () {
//                   // trigger add to fav
//                   // print('tesssssssssssssssttttt');
//                 },
//                 // onHover: (value) {},
//                 child: Expanded(
//                   child: DropdownMenu(
//                     // label: Row(
//                     //   children: [
//                     //     Icon(
//                     //       Icons.arrow_downward_rounded,
//                     //       color: AppColors.mainColor,
//                     //     ),
//                     //     VerticalDivider(
//                     //       color: AppColors.mainColor,
//                     //       // thickness: 2,
//                     //     ),
//                     //     Text("22"),
//                     //   ],
//                     // ),

//                     // leadingIcon: Row(
//                     //   children: [
//                     //     Icon(
//                     //       Icons.arrow_downward_rounded,
//                     //       color: AppColors.mainColor,
//                     //     ),
//                     //     VerticalDivider(
//                     //       color: AppColors.mainColor,
//                     //       // thickness: 2,
//                     //     ),
//                     //     Text("22"),
//                     //   ],
//                     // ),

//                     //
//                     //
//                     //

//                     // leadingIcon: Icon(
//                     //   Icons.arrow_downward_rounded,
//                     //   color: AppColors.mainColor,
//                     //   size: 10,
//                     // ),

//                     enableSearch: true,
//                     onSelected: (value) {
//                       print(value);
//                     },
//                     initialSelection: "1",
//                     menuHeight: 150,
//                     width: 25,

//                     menuStyle: MenuStyle(
//                       alignment: Alignment.center,
//                       // backgroundColor:
//                       // MaterialStateProperty.all(AppColors.mainColor),
//                       backgroundColor: MaterialStateProperty.all(Colors.white),

//                       surfaceTintColor:
//                           MaterialStateProperty.all(AppColors.grey2Color),
//                       // surfaceTintColor:
//                       //     MaterialStatePropertyAll(Colors.transparent),
//                     ),
//                     dropdownMenuEntries: [
//                       DropdownMenuEntry(
//                         value: String,
//                         label: '1',
//                         labelWidget:
//                             Text('1', style: _customDropdownlistItemTextStyle),
//                       ),
//                       DropdownMenuEntry(
//                           value: String,
//                           label: '2',
//                           labelWidget: Text(
//                             "2",
//                             style: _customDropdownlistItemTextStyle,
//                           )),
//                       DropdownMenuEntry(
//                           value: String,
//                           label: '3',
//                           labelWidget: Text(
//                             "3",
//                             style: _customDropdownlistItemTextStyle,
//                           )),
//                       DropdownMenuEntry(
//                           value: String,
//                           label: '4',
//                           labelWidget: Text(
//                             "4",
//                             style: _customDropdownlistItemTextStyle,
//                           )),
//                       DropdownMenuEntry(
//                           value: String,
//                           label: '5',
//                           labelWidget: Text(
//                             "5",
//                             style: _customDropdownlistItemTextStyle,
//                           )),
//                       DropdownMenuEntry(
//                           value: String,
//                           label: '6',
//                           labelWidget: Text(
//                             "6",
//                             style: _customDropdownlistItemTextStyle,
//                           )),
//                       DropdownMenuEntry(
//                           value: String,
//                           label: '7',
//                           labelWidget: Text(
//                             "7",
//                             style: _customDropdownlistItemTextStyle,
//                           )),
//                       DropdownMenuEntry(
//                           value: String,
//                           label: '8',
//                           labelWidget: Text(
//                             "8",
//                             style: _customDropdownlistItemTextStyle,
//                           )),
//                       DropdownMenuEntry(
//                           value: String,
//                           label: '9',
//                           labelWidget: Text(
//                             "9",
//                             style: _customDropdownlistItemTextStyle,
//                           )),
//                     ],

//                     // initialSelection: int,
//                   ),

// //                   child: CustomDropdown<String>(

// //                     // canCloseOutsideBounds: true,
// // // overlayHeight:  ,

// //                     listItemPadding: EdgeInsets.symmetric(
// //                       horizontal: 6,
// //                       vertical: 10,
// //                     ),
// //                     // hintText: 'Select items count',
// //                     items: [
// //                       "1",
// //                       "2",
// //                       "3",
// //                       "4",
// //                       "5",
// //                       "6",
// //                       "7",
// //                       "8",
// //                       "9",
// //                     ],
// //                     initialItem: "1",
// //                     maxlines: 1,
// // // listItemBuilder: (context, item, isSelected, onItemSelect) {

// // // },

// //                     itemsListPadding: EdgeInsets.symmetric(
// //                       horizontal: 0,
// //                       vertical: 0,
// //                     ),
// //                     // headerBuilder: (context, selectedItem) {
// //                     //   return const SizedBox();
// //                     // },

// //                     decoration: CustomDropdownDecoration(
// //                         listItemStyle: TextStyle(
// //                       color: AppColors.mainColor,
// //                       fontWeight: FontWeight.bold,
// //                       fontSize: 20,
// //                       height: .5,
// //                     )),
// //                     onChanged: (value) {
// //                       log('changing value to: $value');
// //                     },
// //                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//               width: 10,
//             ),
//             Container(
//               width: 55,
//               height: 45,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 12.5,
//               ),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: AppColors.mainColor,
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//               ),
//               child: InkWell(
//                 borderRadius: BorderRadius.circular(10),
//                 onTap: () {
//                   // trigger add to fav
//                   // print('tesssssssssssssssttttt');
//                 },
//                 // onHover: (value) {},
//                 child: SizedBox(
//                   width: 30,
//                   height: 30,
//                   child: SvgPicture.asset(
//                     AppImagesSvg.favourtsStorkSvg,
//                     // alignment: Alignment.center,
//                   ),
//                 ),
//               ),
//             ),
//             // SizedBox(
//             //   height: 10,
//             //   width: 10,
//             // ),
          ],
        ),
      ),
    );
  }
}

class _NavigateToAllCommentsWidget extends StatelessWidget {
  const _NavigateToAllCommentsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // navigate to all comments widget
      onTap: () {
        // navigate to all comments screen
      },
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).showAll,
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 5,
                height: 5,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 5,
                color: AppColors.mainColor,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class _BrandNameAndDetialsWidget extends StatelessWidget {
  final String? theBrandName, theImageUrl;
  // final double? theNumberOfProducts;
  const _BrandNameAndDetialsWidget({
    super.key,
    required this.theBrandName,
    required this.theImageUrl,
    // required this.theNumberOfProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
            width: 120,
            height: 80,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: AppColors.mainColor,
            ),
            child: Image(
              image: NetworkImage(
                theImageUrl ?? AppConstants.cachedRandomeNetworkImage,
                // fit: BoxFit.cover,
              ),
              fit: BoxFit.cover,
            )),
        const SizedBox(
          height: 15,
          width: 15,
        ),
        Row(
          children: [
            // const Spacer(),

            Flexible(
              // first flexible
              flex: 5,
              child: SizedBox(
                height: 75,
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 32,
                      width: double.infinity,
                      child: RichText(
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "${S.of(context).brand} : ",
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                height: .8,
                              ),
                            ),
                            TextSpan(
                              text: theBrandName ?? S.of(context).brand,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: AppColors.greyColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                height: .8,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //     height: 32,
                    //     width: double.infinity,
                    //     child: AppButton(
                    //       title: "brand details",
                    //       backgroundColor: Colors.white,
                    //       onTap: () {
                    //         // navigate to barnd details
                    //       },
                    //       borderColor: AppColors.mainColor,
                    //       height: 25,
                    //       textColor: AppColors.mainColor,
                    //     )),

                    InkWell(
                      borderRadius: AppConstants.theNewBorderRadius,
                      onTap: () {
                        // navigate to brand details
                      },
                      child: Container(
                        width: double.infinity,
                        height: 32,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(5),
                          borderRadius: AppConstants.theNewBorderRadius,
                          border: Border.all(
                            color: AppColors.mainColor,
                          ),
                        ),
                        child: Text(
                          S.of(context).brandDetails,
                          style: TextStyle(
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: .8,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            ///
            ///
            // const Spacer(),
            // const Spacer(),
            // AppConstants.emptySpaceTenPixl,
            // AppConstants.emptySpaceTenPixl,

            ///
            ///

            // Flexible(
            //   // second flexible
            //   flex: 5,
            //   child: SizedBox(
            //     height: 75,
            //     width: double.infinity,
            //     child: Column(
            //       mainAxisSize: MainAxisSize.max,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Container(
            //           alignment: Alignment.centerLeft,
            //           height: 32,
            //           width: double.infinity,
            //           child: RichText(
            //             maxLines: 1,
            //             textAlign: TextAlign.start,
            //             text: TextSpan(
            //               children: <TextSpan>[
            //                 TextSpan(
            //                   text: "show : ",
            //                   style: TextStyle(
            //                     color: AppColors.mainColor,
            //                     fontWeight: FontWeight.w400,
            //                     fontSize: 17,
            //                     height: .8,
            //                   ),
            //                 ),
            //                 TextSpan(
            //                   text: theNumberOfProducts != null
            //                       ? theNumberOfProducts!.toInt().toString()
            //                       : "brand",
            //                   style: TextStyle(
            //                     overflow: TextOverflow.ellipsis,
            //                     color: AppColors.greyColor,
            //                     fontWeight: FontWeight.w400,
            //                     fontSize: 17,
            //                     height: .8,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         // SizedBox(
            //         //     height: 32,
            //         //     width: double.infinity,
            //         //     child: AppButton(
            //         //       title: "brand details",
            //         //       backgroundColor: Colors.white,
            //         //       onTap: () {
            //         //         // navigate to barnd details
            //         //       },
            //         //       borderColor: AppColors.mainColor,
            //         //       height: 25,
            //         //       textColor: AppColors.mainColor,
            //         //     )),

            //         InkWell(
            //           borderRadius: AppConstants.theNewBorderRadius,
            //           onTap: () {
            //             // navigate to brand details
            //           },
            //           child: Container(
            //             width: double.infinity,
            //             height: 32,
            //             alignment: Alignment.center,
            //             decoration: BoxDecoration(
            //               // borderRadius: BorderRadius.circular(5),
            //               borderRadius: AppConstants.theNewBorderRadius,
            //               color: AppColors.mainColor,
            //               border: Border.all(
            //                 color: AppColors.mainColor,
            //               ),
            //             ),
            //             child: Text(
            //               "show all products",
            //               style: TextStyle(
            //                 // color: AppColors.mainColor,
            //                 color: Colors.white,
            //                 fontWeight: FontWeight.w500,
            //                 fontSize: 14,
            //                 height: .8,
            //               ),
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),

            // const Spacer(),
          ],
        )
      ],
    );
  }
}

class _RandomUserComment extends StatelessWidget {
  final String? randomUserName,
      ratedProudctColorAndSize,
      theRandomeUserComment,
      userComment,
      commentDate;
  final double? ratingNumber;
  const _RandomUserComment({
    super.key,
    this.randomUserName,
    this.ratedProudctColorAndSize,
    this.theRandomeUserComment,
    this.userComment,
    this.commentDate,
    this.ratingNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // random user rating
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 35,
              // width: 100 ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    randomUserName ?? "randome user",
                    overflow: TextOverflow.ellipsis,
                    style: _customTitleTextStyle.copyWith(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                    height: 5,
                  ),
                  Text(
                    ratedProudctColorAndSize ?? "product: color/ size",
                    overflow: TextOverflow.ellipsis,
                    style: _customTitleTextStyle.copyWith(
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 7,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
              height: 10,
            ),
            RatingBar(
              glow: false,
              ignoreGestures: true,
              initialRating: ratingNumber ?? 0,
              itemSize: 15,
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
              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            Spacer(),
            SizedBox(
              width: 35,
              height: 20,
              child: Column(
                children: [
                  Text(
                    randomUserName ?? "12:55:34",
                    overflow: TextOverflow.ellipsis,
                    style: _customTitleTextStyle.copyWith(
                      color: AppColors.greyColor,
                      height: .8,

                      // fontWeight: FontWeight.bold,
                      fontSize: 6,
                    ),
                  ),
                  Container(
                    color: AppColors.greyColor,
                    width: double.infinity,
                    height: 1,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  ),
                  Text(
                    randomUserName ?? "24/5/2024",
                    overflow: TextOverflow.ellipsis,
                    style: _customTitleTextStyle.copyWith(
                      color: AppColors.greyColor,
                      height: .8,
                      // fontWeight: FontWeight.bold,
                      fontSize: 6,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          width: 270,
          child: Text(
            theRandomeUserComment ?? "no comment",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: _customBodyTextStyle.copyWith(
              fontWeight: FontWeight.w400,
              height: 1,
              fontSize: 11,
            ),
          ),
        ),
        Row(
          children: [
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "recomended by (${ratingNumber ?? 100})",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 5,
                  height: 5,
                ),
                SizedBox(
                  width: 15,
                  height: 15,
                  child: SvgPicture.asset(
                    // i should use like picture
                    AppImagesSvg.homeSvg,
                    fit: BoxFit.fitWidth,
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}

class _RatingContainer extends StatelessWidget {
  final double? ratingNumber;
  final String? theRatingQuestion;
  _RatingContainer({
    super.key,
    required this.ratingNumber,
    required this.theRatingQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      padding: EdgeInsets.all(
        15,
      ),
      decoration: BoxDecoration(
          color: AppColors.greyColor.withOpacity(
            .2,
          ),
          borderRadius: BorderRadius.circular(
            10,
          )),
      child: Column(
        children: [
          Row(
            // rating and number and stars
            children: [
              Text(
                //  4.55.toString()   // productRating

                ratingNumber.toString(),
                style: TextStyle(
                    fontSize: 28,
                    height: .8,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor),
              ),
              const SizedBox(
                width: 10,
                height: 10,
              ),
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
                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),

          //
          //

          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 30,
            width: double.infinity,
            child: Text(
              theRatingQuestion ?? "",
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          Row(
            children: [
              // RatingBar.builder(itemBuilder: ( BuildContext context, int ratingNumberrrrrrr) {
              //   return Divider(

              //   );
              // }, onRatingUpdate: onRatingUpdate),

              // Slider(value: 5, onChanged: (newNumber) {}),

              // ProgressIndicator(color: AppColors.mainColor,),

              SizedBox(
                width: 120,
                height: 5,
                child: LinearProgressIndicator(
                  // color: AppColors.mainColor,
                  value: 3,
                  // backgroundColor: AppColors.mainColor.withOpacity(.1),
                  // valueColor: ,
                ),
              ),
              Spacer(),
              SizedBox(
                width: 120,
                height: 5,
                child: LinearProgressIndicator(
                  // color: AppColors.mainColor,
                  value: 3,
                  // backgroundColor: AppColors.mainColor.withOpacity(.1),
                  // valueColor: ,
                ),
              ),

              Spacer(),

              //  ReactiveSlider(
              //     formControlName: 'rating',
              //     divisions: 5,
              //     min: 0,
              //     max: 5,
              //   ),

              // Slider(value: 3, onChanged: (newValue) {})
            ],
          ),

          //
          //
          //
          const SizedBox(
            height: 10,
          ),

          Row(
            children: [
              SizedBox(
                width: 120,
                height: 5,
                child: LinearProgressIndicator(
                  value: 3,
                ),
              ),
              Spacer(),
              SizedBox(
                width: 120,
                height: 5,
                child: LinearProgressIndicator(
                  value: 3,
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

class _RatingWidget extends StatefulWidget {
  final double? productID;

  _RatingWidget({
    super.key,
    required this.productID,
  });

  @override
  State<_RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<_RatingWidget> {
  @override
  void initState() {
    // TODO: implement initState

    print("============================================${widget.productID}");

    context
        .read<ProdCalcuBloc>()
        .add(ProdCalcuInitalEvent(productID: widget.productID));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProdCalcuBloc, ProdCalcuState>(
      builder: (context, state) {
        if (state is ProdCalcuErrorState) {
          return SizedBox(
            height: 10,
            width: 200,
            child: Center(
              child: Text(state.errorMessage ?? S.of(context).unKnownError),
            ),
          );
        }

        if (state is ProdCalcuSucsessState) {
          return SizedBox(
            height: 30,
            width: double.infinity,
            child: Row(
              children: [
                Text(
                  "rating :",
                  overflow: TextOverflow.ellipsis,
                  style: _customTitleTextStyle,
                ),
                const SizedBox(
                  width: 15,
                ),
                RatingBar(
                  glow: false,
                  ignoreGestures: true,
                  initialRating: state
                          .productCalculationsModel.result.averageRating
                          .toDouble() ??
                      0,
                  itemSize: 25,
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
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            ),
          );
        } else {
          return SizedBox(
            height: 10,
            width: 200,
            child: Center(
              child: CustomLoadingScreen(),
            ),
          );
        }
      },
    );
  }
}

class _CategoryDiscriptionRow extends StatelessWidget {
  final String? catigoryDiscription;

  _CategoryDiscriptionRow({
    super.key,
    required this.catigoryDiscription,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Row(
        children: [
          Text(
            "${S.of(context).category} :",
            overflow: TextOverflow.ellipsis,
            style: _customTitleTextStyle,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              catigoryDiscription!,
              overflow: TextOverflow.ellipsis,
              style: _customBodyTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

class _DiscriptionRow extends StatelessWidget {
  final String? discription;

  const _DiscriptionRow({
    super.key,
    required this.discription,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30, // Adjust the height as needed
      width: double.infinity,
      child: Row(
        children: [
          Text(
            "${S.of(context).description}:",
            overflow: TextOverflow.ellipsis,
            style: _customBodyTextStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              discription ?? '',
              overflow: TextOverflow.ellipsis,
              style: _customBodyTextStyle.copyWith(height: 1.2),
              maxLines: 1, // Ensure this is set
            ),
          ),
        ],
      ),
    );
  }
}

class _NumberOfStock extends StatelessWidget {
  final String? stockNumber;

  _NumberOfStock({
    super.key,
    required this.stockNumber,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Row(
        children: [
          Text(
            "the stock :",
            overflow: TextOverflow.ellipsis,
            style: _customTitleTextStyle,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              stockNumber! ?? 0.toString(),
              overflow: TextOverflow.ellipsis,
              style: _customBodyTextStyle.copyWith(
                fontSize: 14,
                color: AppColors.grey2Color,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ColorRow extends StatelessWidget {
  final String? theColor;

  _ColorRow({
    super.key,
    required this.theColor,
  });

  // Helper function to convert hex color string to Color object
  Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor; // Add the alpha value if it's not provided
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            S.of(context).theColor,
            overflow: TextOverflow.ellipsis,
            style: _customTitleTextStyle,
          ),
          const SizedBox(
            width: 15,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 3),
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: Colors.yellowAccent,
                  color: getColorFromHex(
                      theColor!), // Convert the string to a Color
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SizeRow extends StatelessWidget {
  // final bool? isActive;
  // final String? sizes;

  final PropValue propValue;

  _SizeRow({
    super.key,
    // required this.sizes,
    // required this.isActive,
    required this.propValue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            Localizations.localeOf(context).languageCode == "ar"
                ? propValue.productPropName.nameAr
                : propValue.productPropName.nameEn,
            overflow: TextOverflow.ellipsis,
            style: _customTitleTextStyle,
          ),
          const SizedBox(
            width: 15,
          ),
          Row(
            // i should give it the number of sizes and if they active or not
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                decoration: BoxDecoration(
                  color:
                      // isActive == true ? AppColors.mainColor : Colors.white,
                      AppColors.mainColor,
                  border: Border.all(
                    // color: isActive == true
                    //     ? AppColors.mainColor
                    //     : AppColors.grey2Color,
                    color: AppColors.mainColor,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  // "XXL".toUpperCase(),
                  propValue.value.toUpperCase(),
                  style: TextStyle(
                    color:
                        // isActive == true ? Colors.white : AppColors.grey2Color,
                        Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: .8,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ShipmentTitleRow extends StatelessWidget {
  _ShipmentTitleRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            S.of(context).shipmentAllUAE,
            overflow: TextOverflow.ellipsis,
            style: _customTitleTextStyle.copyWith(
              color: AppColors.mainColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _ComentsTitleRow extends StatelessWidget {
  _ComentsTitleRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            S.of(context).comments,
            // overflow: TextOverflow.ellipsis,
            style: _customTitleTextStyle.copyWith(
              color: AppColors.mainColor,
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              // navigate to comments screen
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).showAll,
                // overflow: TextOverflow.ellipsis,
                style: _customTitleTextStyle.copyWith(
                  color: AppColors.mainColor,
                  fontSize: 9,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomShipmentListTile extends StatelessWidget {
  final String discription, svgImgName;
  final void Function()? onTap;
  final bool? haveDivider;

  _CustomShipmentListTile({
    super.key,
    required this.discription,
    required this.svgImgName,
    this.onTap,
    this.haveDivider,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: SizedBox(
        // height: 30,
        height: 45,
        // width: double.infinity,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // icon
              width: 22,
              height: 22,
              child: SvgPicture.asset(
                svgImgName,
                color: AppColors.mainColor,
              ),
            ),
            SizedBox(
              // icon
              width: 10,
              height: 10,
            ),
            Expanded(
              child: Column(
                // discription text
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      // height: double.infinity,
                      height: 25,
                      // color: Colors.redAccent,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            discription,
                            // textAlign: TextAlign.center,

                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: _customTitleTextStyle.copyWith(
                              color: AppColors.grey2Color,
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  haveDivider == true
                      ? Divider(
                          // color: AppColors.greyColor,
                          color: AppColors.greyColor,
                          thickness: .5,
                        )
                      // : Divider(
                      //     // color: AppColors.greyColor,
                      //     color: AppColors.greyColor,
                      //     thickness: .5,
                      //   ),
                      : const SizedBox(height: .5),

                  // //
                  // //

                  // Divider(
                  //   // color: AppColors.greyColor,
                  //   color: Colors.black,
                  //   thickness: 3,
                  // ),
                ],
              ),
            ),
            SizedBox(
              // icon
              width: 10,
              height: 10,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.mainColor,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleRow extends StatelessWidget {
  final String? theImageLink, oldPrice, newPrice, productName, brandName;
  const _TitleRow({
    super.key,
    required this.theImageLink,
    required this.oldPrice,
    required this.newPrice,
    required this.productName,
    required this.brandName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Row(
        // title and brand name
        children: [
          Flexible(
            flex: 50,
            child: Column(
              children: [
                SizedBox(
                  // product name
                  height: 30,
                  width: double.infinity,
                  child: Text(
                    productName!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      height: .8,
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      // brand name and picture
                      height: 10,
                      // width: double.infinity,
                      // width: 50,

                      child: Text(
                        // brand name
                        brandName!.toUpperCase(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: .6,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      // barnd image
                      height: 20,
                      width: 30,
                      // child: Image.asset(
                      //   AppImages.chanelLogoJfif,
                      //   fit: BoxFit.fitHeight,
                      // ),
                      child: Image(
                          image: NetworkImage(
                        theImageLink ?? globalDefaltCachedNetworkImage,
                      )),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 50,
            child: Row(
              children: [
                Spacer(),
                Column(
                  children: [
                    Text(
                      // old price with AED
                      "${oldPrice} AED",
                      overflow: TextOverflow.ellipsis,

                      maxLines: 1,
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.bold,
                        decoration:
                            TextDecoration.lineThrough, // fontStyle: FontStyle.
                      ),
                    ),
                    Text(
                      // big green AED
                      "AED",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          height: .7,
                          decorationStyle: TextDecorationStyle.dashed
                          // fontStyle: FontStyle.
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: Text(
                    newPrice!.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    // textAlign: TextAlign.center,

                    style: TextStyle(
                      height: .6,
                      color: AppColors.mainColor,
                      fontSize: 66,
                      fontWeight: FontWeight.bold,
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

class _ProductPicticher extends StatelessWidget {
  final List<ImageCartProduct> imageCartProductList;
  const _ProductPicticher({
    super.key,
    required this.imageCartProductList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: Stack(
        children: [
          // Expanded(
          //     child: Image.asset(
          //         // key:

          //         fit: BoxFit.cover,
          //         AppImages.mainCarouselSliderPng)),

          Expanded(
            child: _CustomCarsoulSlider(
              imageCartProductList: imageCartProductList,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _SmallTagContainer(
                    isActive: false,
                  ),
                  _SmallTagContainer(
                    isActive: true,
                  ),
                  _SmallTagContainer(
                    isActive: false,
                  ),
                  _SmallTagContainer(
                    isActive: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomCarsoulSlider extends StatelessWidget {
  final List<ImageCartProduct> imageCartProductList;

  const _CustomCarsoulSlider({
    super.key,
    required this.imageCartProductList,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(15),
              ),
          clipBehavior: Clip.hardEdge,
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              height: double.infinity,

              // scrollDirection: Axis.vertical,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),

              onPageChanged: (index, reason) {
                // context
                //     .read<ActiveProductImageTagCubit>()
                //     .changeTheActiveImage(index);
                // print(
                //     "neeeeeeeeeeeeeeeeeeeeeeeeeee${context.read<ProductDetailsBloc>().activeProductImage}");
              },
            ),
            items: imageCartProductList.map((productImage) {
              return Builder(
                builder: (
                  BuildContext context,
                ) {
                  return Image(
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        productImage.imageUrl,
                      ));
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _SmallTagContainer extends StatelessWidget {
  final bool isActive;
  const _SmallTagContainer({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 3,
      ),
      width: 20,
      height: 5,
      decoration: BoxDecoration(
          color: isActive == true ? AppColors.mainColor : Colors.white,
          border: Border.all(
            color: AppColors.mainColor,
          )),
    );
  }
}
