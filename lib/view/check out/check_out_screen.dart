// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as MaterrialFramwork;
import 'package:flutter/widgets.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkApms.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/helpers/user_experience_helper.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/main.dart';
import 'package:select_shop/view/choose%20pament%20method/choose_payment_method_screen.dart';
import 'package:select_shop/view/user%20location/user_location_screen.dart';

part 'handeler.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
              _ConfirmButton(
                amount: 260.55,
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
      ),
    );
  }
}

class _ConfirmButton extends StatefulWidget {
  final double amount;
  const _ConfirmButton({
    super.key,
    required this.amount,
  });

  @override
  State<_ConfirmButton> createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<_ConfirmButton> {
  @override
  void initState() {
// if( Localizations.localeOf(context).languageCode == "ar" ){
//   PaymentResponseHandler handlerAr = PaymentResponseHandler(language: 'ar');

// }

// if( Localizations.localeOf(context).languageCode == "ar" ){
//   PaymentResponseHandler handlerAr = PaymentResponseHandler(language: 'ar');

// }

    super.initState();
  }

  PaymentSdkConfigurationDetails generateConfig({
    required double? amount,
  }) {
    BillingDetails billingDetails = BillingDetails(
      "hummam",
      "hamam@gmial.com",
      "+971561430879",
      "st. 12",
      "AE",
      "dubai",
      "dubai",
      "12345",
    );
    ShippingDetails shippingDetails = ShippingDetails(
      "hummam",
      "hamam@domain.com",
      "+971561430879",
      "st. 12",
      "AE",
      "dubai",
      "dubai",
      "12345",
    );
    // BillingDetails billingDetails = BillingDetails(
    //   name: "hummam",
    //   email: "hamam@gmial.com",
    //   phone: "+971561430879",
    //   addressLine: "st. 12",
    //   country: "eg",
    //   city: "dubai",
    //   state: "dubai",
    //   zipCode: "12345",
    // );
    // ShippingDetails shippingDetails = ShippingDetails(
    //   name: "hummam",
    //   email: "hamam@domain.com",
    //   phone: "+971561430879",
    //   addressLine: "st. 12",
    //   country: "eg",
    //   city: "dubai",
    //   state: "dubai",
    //   zipCode: "12345",
    // );
    List<PaymentSdkAPms> apms = [];
    // apms.add(PaymentSdkAPms.AMAN);
    apms.add(PaymentSdkAPms.TABBY);
    final configuration = PaymentSdkConfigurationDetails(
      profileId: "140553",
      serverKey: "SGJ9NWBG9J-JHW6LZNJD9-HWW6RDJL62",
      clientKey: "C2K2MK-Q2HH6H-VGB9Q6-H9BPMG",
      cartId: "12433",
      cartDescription: "Flowers",
      merchantName: "Select Shop",
      screentTitle: "Pay with Card",
      amount: amount,
      showBillingInfo: true,
      forceShippingInfo: false,
      currencyCode: "AED",
      merchantCountryCode: "AE",
      billingDetails: billingDetails,
      // shippingDetails: shippingDetails,
      alternativePaymentMethods: apms,
      // linkBillingNameWithCardHolderName: true,
    );
    final theme = IOSThemeConfigurations();

    configuration.iOSThemeConfigurations = theme;
    // configuration.tokeniseType = PaymentSdkTokeniseType!.MERCHANT_MANDATORY;
    configuration.cardDiscounts = [
      // PaymentSDKCardDiscount(
      //     discountCards: ["4111"],
      //     discountValue: 50,
      //     discountTitle: "50% discount on cards starting with 4111",
      //     isPercentage: true),
      // PaymentSDKCardDiscount(
      //     discountCards: ["4000", "41111"],
      //     discountValue: 2,
      //     discountTitle: "2 discount on cards starting with 4000 and 41111",
      //     isPercentage: false)
    ];
    return configuration;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 5,
      onTap: () async {
        // print("ttttttttttttttttttttttttttttttttttttttttttttt");
        // confirm checkout, or go to payment screen

        // if payment method is card
        // navigate to card payment screen

        Future<void> payPressed() async {
          FlutterPaytabsBridge.startCardPayment(
              generateConfig(amount: widget.amount), (event) {
            setState(() {
              if (event["status"] == "success") {
                // Handle transaction details here.

                // print("sucssssssssssssssssssssssssesss: $event");

// // #### #### //
//                 PaymentResponseHandler handlerAr =
//                     PaymentResponseHandler(language: 'ar');

//                 PaymentResponseHandler handlerEn =
//                     PaymentResponseHandler(language: 'en');

//                 String responseStatus = 'E';
//                 String responseCode = '200';

//                 print(
//                     'English: ${handlerEn.handleResponse(responseStatus, responseCode)}');

//                 print(
//                     'Arabic: ${handlerAr.handleResponse(responseStatus, responseCode)}');

// // #### #### //

                var transactionDetails = event["data"];
                // print(transactionDetails);
                if (transactionDetails["isSuccess"]) {
                  // print("sucssssssssssssssssssssssssesss: $transactionDetails");

                  UserExperinceHelper().showCustomDialog(
                    theContext: context,
                    dialogTitle: "Success",
                    confirmButtonTitle: "confirm",
                    onConfirm: () => Navigator.of(context).pop(),
                  );

                  // print("successful transaction");
                  if (transactionDetails["isPending"]) {
                    UserExperinceHelper().showCustomDialog(
                      theContext: context,
                      dialogTitle: "isPending",
                      confirmButtonTitle: "confirm",
                      onConfirm: () => Navigator.of(context).pop(),
                    );
                    // print("transaction pending");
                  }
                } else {
                  UserExperinceHelper().showCustomDialog(
                    theContext: context,
                    dialogTitle: "failed transaction",
                    confirmButtonTitle: "confirm",
                    onConfirm: () => Navigator.of(context).pop(),
                  );

                  // print("failed transaction");
                }

                // print(transactionDetails["isSuccess"]);
              } else if (event["status"] == "error") {
                // print("error");
                // Handle error here.

                UserExperinceHelper().showCustomDialog(
                  theContext: context,
                  dialogTitle: "failed transaction, error",
                  confirmButtonTitle: "confirm",
                  onConfirm: () => Navigator.of(context).pop(),
                );
              } else if (event["status"] == "event") {
                // print("event");
                // Handle events here.

                UserExperinceHelper().showCustomDialog(
                  theContext: context,
                  dialogTitle: "error",
                  dialogContent: event.toString(),
                  confirmButtonTitle: "confirm",
                  onConfirm: () => Navigator.of(context).pop(),
                );
              }

              // #### #### //
              // #### #### //
              // #### #### //

              // void handleError(BuildContext context, String responseStatus,
              //     String responseCode) {
              //   String message;

              //   if (responseStatus == 'E') {
              //     switch (responseCode) {
              //       case '200':
              //         message =
              //             'Unable to complete process, please try again later.';
              //         break;
              //       case '201':
              //         message = 'Data mismatch.';
              //         break;
              //       case '400':
              //         message = 'Unregistered user.';
              //         break;
              //       case '401':
              //         message = 'Verification code mismatch.';
              //         break;
              //       case '402':
              //         message = 'Incorrect identification number.';
              //         break;
              //       default:
              //         message = 'An error occurred, please try again.';
              //         break;
              //     }
              //   } else if (responseStatus == 'F') {
              //     switch (responseCode) {
              //       case '500':
              //         message =
              //             'Server is under maintenance, please try later.';
              //         break;
              //       default:
              //         message = 'An error occurred, please try again.';
              //         break;
              //     }
              //   } else {
              //     message = 'Unknown status, please contact support.';
              //   }

              //   UserExperinceHelper().showCustomDialog(
              //     theContext: context,
              //     dialogTitle: "Error",
              //     confirmButtonTitle: "Retry",
              //     onConfirm: () {
              //       Navigator.pop(context);
              //       // Optionally, implement retry logic here
              //     },
              //   );

              //   print(message);
              // }

              // void handlePaymentEvent(
              //     Map<String, dynamic> event, BuildContext context) {
              //   if (event["status"] == "success" ||
              //       event["status"] == "error" ||
              //       event["status"] == "event") {
              //     var transactionDetails = event["data"];

              //     if (event["status"] == "success") {
              //       if (transactionDetails["isSuccess"]) {
              //         UserExperinceHelper().showCustomDialog(
              //           theContext: context,
              //           dialogTitle: "success",
              //           confirmButtonTitle: "confirm",
              // onConfirm: () => Navigator.of(context).pop(),
              //         );

              //         if (transactionDetails["isPending"]) {
              //           UserExperinceHelper().showCustomDialog(
              //             theContext: context,
              //             dialogTitle: "isPending",
              //             confirmButtonTitle: "confirm",
              // onConfirm: () => Navigator.of(context).pop(),
              //           );
              //         } else {
              //           print("successful transaction");

              //           UserExperinceHelper().showCustomDialog(
              //             theContext: context,
              //             dialogTitle: "successful",
              //             confirmButtonTitle: "confirm",
              // onConfirm: () => Navigator.of(context).pop(),
              //           );
              //         }
              //       } else {
              //         print("failed transaction");
              //         handleError(context, transactionDetails["responseStatus"],
              //             transactionDetails["responseCode"]);
              //       }
              //     } else if (event["status"] == "error") {
              //       print("error");
              //       handleError(context, transactionDetails["responseStatus"],
              //           transactionDetails["responseCode"]);
              //     }

              //     /// other events here

              //     else if (event["status"] == "event") {
              //       var eventData = event["data"];

              //       // Handle other events based on their types
              //       switch (eventData["eventType"]) {
              //         case "notification":
              //           // Handle notification event
              //           print(
              //               "Received notification event: ${eventData["message"]}");
              //           break;
              //         case "update":
              //           // Handle update event
              //           print("Received update event: ${eventData["version"]}");
              //           break;
              //         default:
              //           // Handle unknown event type
              //           print(
              //               "Received unknown event type: ${eventData["eventType"]}");
              //       }
              //     }
              //   }
              // }

              // handlePaymentEvent(event, context);

              // #### #### //
              // #### #### //
              // #### #### //
            });
          });
        }

        payPressed();

        // if payment method is cash
        // send the reqest to the api

        // if no paymnet method selected
        if (
            // selectPaymentMethod == false
            true == false
            // false == false
            ) {
          UserExperinceHelper().showCustomDialog(
            theContext: context,
            dialogTitle: "Payment Method!!",
            dialogContent: "please selcet payment method",
            confirmButtonTitle: "ok",
            onConfirm: () => Navigator.of(context).pop(),
          );
        }
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
          S.of(context).confirm,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              height: .8),
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
                      AppImagesSvg.creditCardsSvg,
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
        borderRadius: BorderRadius.circular(10),
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
                      border: Border.all(
                        color: AppColors.mainColor,
                        width: 1,
                      ),
                    ),
                    // user image

                    child: MaterrialFramwork.Image(
                      height: 33,
                      width: 33,
                      image: NetworkImage(
                        AppConstants.cachedRandomeNetworkImage,
                      ),
                    ),
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
                      globalCachedUserName ?? AppConstants.cachedUserName,
                      style: TextStyle(
                          color: AppColors.grey2Color,
                          fontSize: 15,
                          height: .8),
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
            // user Location ListTile
            onTap: () {
              navigateTo(context, UserLocationsScreen());
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
                          AppImagesSvg.locationFilledSvg,
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
                                      // cashed user location, longtude and lateute
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
                          AppImagesSvg.creditCardsSvg,
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
