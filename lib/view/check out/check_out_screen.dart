// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:cached_network_image/cached_network_image.dart';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as MaterrialFramwork;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkApms.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkLocale.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http_status/http_status.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/core/helpers/user_experience_helper.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/main.dart';
import 'package:select_shop/view/cart/model/cart_model.dart';
import 'package:select_shop/view/cart/widgets/product_card.dart';
import 'package:select_shop/view/check%20out/bloc/check_out_bloc.dart';
import 'package:select_shop/view/check%20out/models/confirm_payment_response_model.dart';
import 'package:select_shop/view/check%20out/models/post_order_model.dart';
import 'package:select_shop/view/check%20out/models/post_order_response_model.dart';
import 'package:select_shop/view/choose%20pament%20method/choose_payment_method_screen.dart';
import 'package:select_shop/view/home/home_screen.dart';
import 'package:select_shop/view/user%20location/user_location_screen.dart';

part 'handeler.dart';

class CheckOutScreen extends StatelessWidget {
  final CartModel cartModel;
  const CheckOutScreen({super.key, required this.cartModel});

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
              _CartDetails(
                cartModel: cartModel,
              ),

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
                theNewPrice: cartModel.result.cart.total.toString(),
                theDiscount: "0",
                deliveryPrice: "20",
                totalPrice: cartModel.result.cart.total.toString(),
              ),

              ///
              ///
              ///

              const SizedBox(
                height: 20,
              ),

              // confirm button
              _ConfirmButton(
                // amount: 260.55,
                cartModel: cartModel,
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

class _CartDetails extends StatelessWidget {
  final CartModel cartModel;
  _CartDetails({
    super.key,
    required this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    List<CartItem> cartItems = cartModel.result.cart.cartItems;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).cartDetails,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.grey2Color,
            fontWeight: FontWeight.bold,
            fontSize: 12,
            height: .8,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 280,
          padding: EdgeInsets.all(
            15,
          ),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: AppColors.grey2Color.withOpacity(.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  // padding: const EdgeInsets.symmetric(
                  //   horizontal: 15,
                  //   vertical: 30,
                  // ),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return ProductCart(
                      cartItem: cartItems[index],
                      cartModel: cartModel,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ConfirmButton extends StatefulWidget {
  // final double amount;
  final CartModel cartModel;
  const _ConfirmButton({
    super.key,
    // required this.amount,
    required this.cartModel,
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

    // print(
    //     "===s=s=s=s=s=s=s=s=s=s=s=s=s=s=s=s=s=s${widget.cartModel.result.cart.id}");

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

    final theme = IOSThemeConfigurations(
      // backgroundColor: AppColors.mainColor
      // backgroundColor: "ff79B700",

      buttonColor: "#79B700",

      inputsCornerRadius: 10,
      logoImage: AppImages.logoPng,
      primaryColor: "#EBEBEB",
      buttonFont: "Cairo",
      titleFont: "Cairo",
      primaryFont: "Cairo",

      // secondaryColor:
    );

    // PaymentSdkLocale paymentSdkLocale =PaymentSdkLocale(  );

    final configuration = PaymentSdkConfigurationDetails(
      profileId: "140553",
      serverKey: "SGJ9NWBG9J-JHW6LZNJD9-HWW6RDJL62",
      clientKey: "C2K2MK-Q2HH6H-VGB9Q6-H9BPMG",
      // cartId: "12433",
      cartId: widget.cartModel.result.cart.id.toString(),
      cartDescription: "customer",
      merchantName: "Select Shop",
      screentTitle: S.of(context).payWithCart,
      iOSThemeConfigurations: theme,
      amount: amount,
      showBillingInfo: true,
      forceShippingInfo: false,
      currencyCode: "AED",
      merchantCountryCode: "AE",
      locale: Localizations.localeOf(context).languageCode == "ar"
          ? PaymentSdkLocale.AR
          : PaymentSdkLocale.EN,

      expiryTime: 90,
      billingDetails: billingDetails,
      // shippingDetails: shippingDetails,
      alternativePaymentMethods: apms,
      // linkBillingNameWithCardHolderName: true,
    );

    // configuration.iOSThemeConfigurations = theme;
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

  cachPayment() async {
    // #### if payment method is cach //
// #### complete the order checkout #### //
    Response addOrderToCheckoutResponse = await DioHelper.postAddOrder(
        cartId: widget.cartModel.result.cart.id,
        orderAddress: OrderAddress(
          addressOne: "test",
          cityId: 1,
          email: "",
          paymentType: 111,
          phoneNumber: globalCachedUserPhoneNum ?? "",
          recievername: globalCachedUserName ?? "",
        ));
    if (addOrderToCheckoutResponse.statusCode != null) {
      if (addOrderToCheckoutResponse.statusCode!.isSuccessfulHttpStatusCode) {
        if (addOrderToCheckoutResponse.statusCode!.isSuccessfulHttpStatusCode) {
          PostOrderResponseModel postOrderResponseModel =
              PostOrderResponseModel.fromJson(addOrderToCheckoutResponse.data);
          // var theResponse = jsonDecode(addOrderToCheckoutResponse.data);
          if (postOrderResponseModel.message == "Success") {
            // UserExperinceHelper().showCustomDialog(
            //   theContext: context,
            //   dialogTitle: "Success order addddedt",
            //   confirmButtonTitle: "confirm",
            //   onConfirm: () => Navigator.of(context).pop(),
            // );

            Response confirmPaymentResponse = await DioHelper.getConfirmPayment(
                orderId: postOrderResponseModel.result.order.id);

            ConfirmPaymentResponseModel confirmPaymentResponseModel =
                ConfirmPaymentResponseModel.fromJson(
                    confirmPaymentResponse.data);

            if (confirmPaymentResponseModel.message == "SUCCESS") {
              // print(
              //     "===s=s=s=s=s=s=s=s=s=s=s=s=s=s=s=s=s=s8945t6983459834598743");

              // payPressed();
            }

            return;
          }
        }
      } else {
        return;
      }
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 5,
      onTap: () async {
// check if i can parse the total from string to double or not
        double? theTotal = double.tryParse(widget.cartModel.result.cart.total);
        if (theTotal == null ||
            theTotal.isNegative ||
            theTotal.runtimeType != double) {
          UserExperinceHelper().showCustomDialog(
            theContext: context,
            dialogTitle: S.of(context).error,
            dialogContent: "$theTotal is not true",
            confirmButtonTitle: "confirm",
            onConfirm: () => Navigator.of(context).pop(),
          );
          return;
        }
        if (context.read<CheckOutBloc>().paymentMethod == 222) {
//////////////////////////////////////////////////////////////////////////////////////

          // if payment method is card
          // navigate to card payment screen

          Future<void> payPressed() async {
            FlutterPaytabsBridge.startCardPayment(
                generateConfig(
                  // amount: widget.amount
                  amount: theTotal,
                ), (event) {
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

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (Route<dynamic> route) => false,
                    );

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
              });
            });
          }

// #### complete the order checkout then payment #### //
          Response addOrderToCheckoutResponse = await DioHelper.postAddOrder(
              cartId: widget.cartModel.result.cart.id,
              orderAddress: OrderAddress(
                addressOne: "test",
                cityId: 1,
                email: "",
                paymentType: 222,
                phoneNumber: globalCachedUserPhoneNum ?? "",
                recievername: globalCachedUserName ?? "",
              ));
          if (addOrderToCheckoutResponse.statusCode != null) {
            if (addOrderToCheckoutResponse
                .statusCode!.isSuccessfulHttpStatusCode) {
              if (addOrderToCheckoutResponse
                  .statusCode!.isSuccessfulHttpStatusCode) {
                PostOrderResponseModel postOrderResponseModel =
                    PostOrderResponseModel.fromJson(
                        addOrderToCheckoutResponse.data);
                // var theResponse = jsonDecode(addOrderToCheckoutResponse.data);
                if (postOrderResponseModel.message == "Success") {
                  // UserExperinceHelper().showCustomDialog(
                  //   theContext: context,
                  //   dialogTitle: "Success order addddedt",
                  //   confirmButtonTitle: "confirm",
                  //   onConfirm: () => Navigator.of(context).pop(),
                  // );

                  Response confirmPaymentResponse =
                      await DioHelper.getConfirmPayment(
                          orderId: postOrderResponseModel.result.order.id);

                  ConfirmPaymentResponseModel confirmPaymentResponseModel =
                      ConfirmPaymentResponseModel.fromJson(
                          confirmPaymentResponse.data);

                  if (confirmPaymentResponseModel.message == "SUCCESS") {
                    // print(
                    //     "===s=s=s=s=s=s=s=s=s=s=s=s=s=s=s=s=s=s8945t6983459834598743");

                    payPressed();
                  }

                  return;
                }
              }
            } else {
              return;
            }
          } else {
            return;
          }

          // payPressed();

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
        } else {
          print(
              'Arabic: 999999999999999999999999999999999999999999999999999999999');
          cachPayment();
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
                "${S.of(context).price} : ",
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
                      "${S.of(context).theDiscaount} : ",
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
                "${S.of(context).taxes} : ",
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
                      "${S.of(context).deliveryPrice} : ",
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
                      "${S.of(context).totalPrice} : ",
                      style: TextStyle(
                          color: AppColors.grey2Color,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          height: .8),
                    ),
                    Spacer(),
                    Text(
                      "$totalPrice" " " "AED",
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
          S.of(context).doYouHaveCopons,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.grey2Color,
            fontWeight: FontWeight.bold,
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
            borderRadius: BorderRadius.circular(10),
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

              // BoxShadow(
              //   offset: Offset(0, 1),
              //   blurRadius: 1,
              //   spreadRadius: 1,
              //   color: Colors.black12,
              // ),
            ],
          ),
          child: Container(
            height: 38,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.grey2Color.withOpacity(.1),
              borderRadius: BorderRadius.circular(10),
              // boxShadow: AppConstants.theBoxShdow,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
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
                    S.of(context).enterCoponCode,
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
                    "${S.of(context).deliverTo} : ",
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
                                  S.of(context).location,
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
                                  S.of(context).paymentMethod,
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
                                          child: BlocBuilder<CheckOutBloc,
                                              CheckOutState>(
                                            builder: (context, state) {
                                              return Row(
                                                children: [
                                                  // Spacer(),
                                                  // context
                                                  //             .read<
                                                  //                 CheckOutBloc>()
                                                  //             .paymentMethod ==
                                                  //         222

                                                  (state is CheckOutSucsessState && state.paymentMethod == 222 )
                                                      ? Text(
                                                          "XXXX XXXX XXXX ",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .grey2Color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 15,
                                                              height: .8),
                                                        )
                                                      : const SizedBox(),

                                                  // context.read<CheckOutBloc>().paymentMethod ==
                                                  //         222

                                                   (state is CheckOutSucsessState && state.paymentMethod == 222 )
                                                      ? Text("3478",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .grey2Color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 15,
                                                              height: .8))
                                                      : const SizedBox(),

                                                  // context
                                                  //             .read<
                                                  //                 CheckOutBloc>()
                                                  //             .paymentMethod ==
                                                  //         111
                                                        
                                                         (state is CheckOutSucsessState && state.paymentMethod == 111 )
                                                      ? Text(
                                                          S
                                                              .of(context)
                                                              .paymentOnRecive,
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .grey2Color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 15,
                                                              height: .8),
                                                        )
                                                      : const SizedBox(),
                                                ],
                                              );
                                            },
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
