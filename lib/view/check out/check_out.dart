// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/view/choose%20pament%20method/choose_payment_method_screen.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            ///
            ///
            ///

            const SizedBox(
              height: 20,
            ),
            _UserNameAndDeliverInfo(),

            ///
            ///
            ///

            const SizedBox(
              height: 20,
            ),

            // user ordered produects, or the products on the cart

            ///
            ///
            ///

            const SizedBox(
              height: 20,
            ),

            // enter copones
            //
            _EnterYourCoponsRow(),

            ///
            ///
            ///

            const SizedBox(
              height: 20,
            ),

            // check out details

            _CheckOutDetails(
              theNewPrice: "299",
              theDiscount: "7",
              deliveryPrice: "20",
              totalPrice: "240",
            ),

            ///
            ///
            ///

            const SizedBox(
              height: 20,
            ),

            // confirm button
            InkWell(
              radius: 5,
              onTap: () {
// confirm checkout, or go to payment screen
              },
              child: Container(
                height: 37,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "Confirm Checkout",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      height: .8),
                ),
              ),
            ),

            ///
            ///
            ///

            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

// check out details

class _CheckOutDetails extends StatelessWidget {
  final String? theNewPrice, theDiscount, deliveryPrice, totalPrice;
  const _CheckOutDetails({
    super.key,
    required this.theNewPrice,
    required this.theDiscount,
    required this.deliveryPrice,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///
        ///
        ///
        ///
        SizedBox(
          // the price row
          height: 30,
          width: double.infinity,
          child: Row(
            children: [
              Text(
                "Price" " : ",
                style: TextStyle(
                    color: AppColors.grey2Color,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    height: .8),
              ),
              Spacer(),
              Text(
                "$theNewPrice" " " "AED",
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    height: .8),
              ),
            ],
          ),
        ),

        ///
        ///
        ///
        ///
        theDiscount != null
            ? SizedBox(
                // discount row
                height: 30,
                width: double.infinity,
                child: Row(
                  children: [
                    Text(
                      "Discount" " : ",
                      style: TextStyle(
                          color: AppColors.grey2Color,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          height: .8),
                    ),
                    Spacer(),
                    Text(
                      "$theDiscount" " " "%",
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          height: .8),
                    ),
                  ],
                ),
              )
            : const SizedBox(),

        ///
        ///
        ///
        ///
        SizedBox(
          // tax row
          height: 30,
          width: double.infinity,
          child: Row(
            children: [
              Text(
                "taxes" " : ",
                style: TextStyle(
                    color: AppColors.grey2Color,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    height: .8),
              ),
              Spacer(),
              Text(
                "5" " " "%",
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    height: .8),
              ),
            ],
          ),
        ),

        ///
        ///
        ///
        ///
        deliveryPrice != null
            ? SizedBox(
                // the Delivery price row
                height: 30,
                width: double.infinity,
                child: Row(
                  children: [
                    Text(
                      "delivery price" " : ",
                      style: TextStyle(
                          color: AppColors.grey2Color,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          height: .8),
                    ),
                    Spacer(),
                    Text(
                      "$deliveryPrice" " " "AED",
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          height: .8),
                    ),
                  ],
                ),
              )
            : const SizedBox(),

        ///
        ///
        ///

        // CustomPaint(painter: DashedLinePainter()),
        // CustomPaint(painter: LineDashedPainter()),

        SizedBox(
            height: 30,
            width: double.infinity,
            child: Dash(
              // double.infinity is not supported by this packge
              // length: double.infinity,
              length: MediaQuery.of(context).size.width - 30,
              dashColor: AppColors.grey2Color,
            )),

        ///
        ///
        ///
        ///
        totalPrice != null
            ? SizedBox(
                // the total price row
                height: 30,
                width: double.infinity,
                child: Row(
                  children: [
                    Text(
                      "total price" " : ",
                      style: TextStyle(
                          color: AppColors.grey2Color,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          height: .8),
                    ),
                    Spacer(),
                    Text(
                      "200.00" " " "AED",
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          height: .8),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

// class DashedLinePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     double dashWidth = 9, dashSpace = 5, startX = 0;
//     final paint = Paint()
//       ..color = Colors.grey
//       ..strokeWidth = 1;
//     while (startX < size.width) {
//       canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
//       startX += dashWidth + dashSpace;
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }

// class LineDashedPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()..strokeWidth = 2;
//     var max = 35;
//     var dashWidth = 5;
//     var dashSpace = 5;
//     double startY = 0;
//     while (max >= 0) {
//       canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
//       final space = (dashSpace + dashWidth);
//       startY += space;
//       max -= space;
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }

class _EnterYourCoponsRow extends StatelessWidget {
  const _EnterYourCoponsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "do you have copons",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.grey2Color,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: .8,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 38,
          width: double.infinity,
          decoration: BoxDecoration(
            // color: AppColors.grey2Color.withOpacity(.2),
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              // BoxShadow(
              //     blurRadius: 3,
              //     color: AppColors.greyColor.withOpacity(.3),
              //     offset: Offset(3, 6), ),

              // BoxShadow(
              //   color: Colors.grey.withOpacity(0.5),
              //   spreadRadius: 5,
              //   blurRadius: 7,
              //   offset: Offset(0, 3), // changes position of shadow
              // ),

              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 2,
                spreadRadius: 2,
                color: Colors.black12,
              ),
            ],
          ),
          child: Container(
            height: 38,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.grey2Color.withOpacity(.1),
              borderRadius: BorderRadius.circular(5),
              // boxShadow: AppConstants.theBoxShdow,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                // navigate to copon screen
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    // siscer icoon
                    width: 24,
                    height: 24,

                    child: SvgPicture.asset(
                      color: AppColors.mainColor,
                      // fit: BoxFit.fitHeight,
                      AppImages.creditCardsSvg,
                    ),
                  ),

                  const SizedBox(
                    width: 20,
                  ),

                  Text(
                    "enter copon code",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.grey2Color,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      height: .8,
                    ),
                  ),

                  //
                  //
                  Spacer(),

                  //
                  //

                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: AppColors.mainColor,
                  ),

                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _UserNameAndDeliverInfo extends StatelessWidget {
  const _UserNameAndDeliverInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.all(
        15,
      ),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.grey2Color.withOpacity(.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///
          ///
          ///
          // first row
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: 33,
              width: double.infinity,
              child: Row(
                children: [
                  // const SizedBox(
                  //   height: 15,
                  //   width: 15,
                  // ),
                  Container(
                    width: 33,
                    height: 33,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    // user image
                    //

                    // child: CachedNetworkImage(
                    //   height: 33,
                    //   width: 33,
                    //   imageUrl: AppConstants.cachedRandomeImage,
                    // ),
                  ),
                  const SizedBox(
                    height: 15,
                    width: 15,
                  ),
                  Text(
                    "deliver to: ",
                    style: TextStyle(
                        color: AppColors.mainColor, fontSize: 15, height: .8),
                  ),
                  Expanded(
                    child: Text(
                      AppConstants.cachedUserName,
                      style: TextStyle(
                          color: AppColors.mainColor, fontSize: 15, height: .8),
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///
          ///
          ///
          ///

          InkWell(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    children: [
                      // const SizedBox(
                      //   height: 15,
                      //   width: 15,
                      // ),
                      Container(
                        // location icoon
                        width: 33,
                        height: 33,
                        alignment: Alignment.center,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: SvgPicture.asset(
                          color: Colors.white,
                          // fit: BoxFit.fitHeight,
                          AppImages.locationFilledSvg,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 5,
                              // width: 15,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Location",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      height: .8),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      AppConstants.cachedUserName,

                                      // "fdsfre fdsfre fdsfre fdsfre fdsfre fdsfre fdsfre fdsfre fdsfre fdsfre fdsfre fdsfre fdsfre fdsfre fdsfre ",

                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: AppColors.grey2Color,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        height: .8,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 16,
                                    color: AppColors.mainColor,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.grey2Color.withOpacity(.2),
                  // indent: 0,
                  // endIndent: 0,
                  height: 1,
                ),
              ],
            ),
          ),

          ///
          ///
          ///
          ///

          InkWell(
            onTap: () {
              // navigate to choose the payment type
              navigateTo(context, ChoosePaymentMethodScreen());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    children: [
                      // const SizedBox(
                      //   height: 15,
                      //   width: 15,
                      // ),
                      Container(
                        // location icoon
                        width: 33,
                        height: 33,
                        alignment: Alignment.center,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: SvgPicture.asset(
                          color: Colors.white,
                          // fit: BoxFit.fitHeight,
                          AppImages.creditCardsSvg,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 5,
                              // width: 15,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Payment method",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      height: .8),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: Row(
                                            children: [
                                              // Spacer(),
                                              Text(
                                                "XXXX XXXX XXXX ",
                                                style: TextStyle(
                                                    color: AppColors.grey2Color,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15,
                                                    height: .8),
                                              ),

                                              Text(
                                                "3478",
                                                style: TextStyle(
                                                    color: AppColors.grey2Color,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15,
                                                    height: .8),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 16,
                                    color: AppColors.mainColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.grey2Color.withOpacity(.2),
                  // indent: 0,
                  // endIndent: 0,
                  height: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
