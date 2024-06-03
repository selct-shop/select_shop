import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkLocale.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTokenFormat.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTokeniseType.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSDKSavedCardInfo.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTransactionClass.dart';
import 'package:flutter_paytabs_bridge/PaymentSDKQueryConfiguration.dart';
import 'package:select_shop/core/constants/app_images.dart';

import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_paytabs_bridge/PaymentSDKCardDiscount.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkApms.dart';

class PaymentScreen extends StatefulWidget {
  final double amount;

  const PaymentScreen({super.key, required this.amount});
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // String _instructions = 'Tap on "Pay" Button to try PayTabs plugin';

  @override
  void initState() {
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

  Future<void> payPressed() async {
    FlutterPaytabsBridge.startCardPayment(generateConfig(amount: widget.amount),
        (event) {
      setState(() {
        if (event["status"] == "success") {
          // Handle transaction details here.
          var transactionDetails = event["data"];
          print(transactionDetails);
          if (transactionDetails["isSuccess"]) {
            print("sucssssssssssssssssssssssssesss: $transactionDetails");

            print("successful transaction");
            if (transactionDetails["isPending"]) {
              print("transaction pending");
            }
          } else {
            print("failed transaction");
          }

          // print(transactionDetails["isSuccess"]);
        } else if (event["status"] == "error") {
          print("error");
          // Handle error here.
        } else if (event["status"] == "event") {
          print("event");
          // Handle events here.
        }
      });
    });
  }

  // Future<void> payWithTokenPressed() async {
  //   FlutterPaytabsBridge.startTokenizedCardPayment(
  //       generateConfig(amount: 300), "*Token*", "*TransactionReference*", (event) {
  //     setState(() {
  //       if (event["status"] == "success") {
  //         // Handle transaction details here.
  //         var transactionDetails = event["data"];
  //         print(transactionDetails);
  //         if (transactionDetails["isSuccess"]) {
  //           print("successful transaction");
  //           if (transactionDetails["isPending"]) {
  //             print("transaction pending");
  //           }
  //         } else {
  //           print("failed transaction");
  //         }

  //         // print(transactionDetails["isSuccess"]);
  //       } else if (event["status"] == "error") {
  //         // Handle error here.
  //       } else if (event["status"] == "event") {
  //         // Handle events here.
  //       }
  //     });
  //   });
  // }

  // Future<void> payWith3ds() async {
  //   FlutterPaytabsBridge.start3DSecureTokenizedCardPayment(
  //       generateConfig(),
  //       PaymentSDKSavedCardInfo("4111 11## #### 1111", "visa"),
  //       "*Token*", (event) {
  //     setState(() {
  //       if (event["status"] == "success") {
  //         // Handle transaction details here.
  //         var transactionDetails = event["data"];
  //         print(transactionDetails);
  //         if (transactionDetails["isSuccess"]) {
  //           print("successful transaction");
  //           if (transactionDetails["isPending"]) {
  //             print("transaction pending");
  //           }
  //         } else {
  //           print("failed transaction");
  //         }

  //         // print(transactionDetails["isSuccess"]);
  //       } else if (event["status"] == "error") {
  //         // Handle error here.
  //       } else if (event["status"] == "event") {
  //         // Handle events here.
  //       }
  //     });
  //   });
  // }

  // Future<void> payWithSavedCards() async {
  //   FlutterPaytabsBridge.startPaymentWithSavedCards(generateConfig(), false,
  //       (event) {
  //     setState(() {
  //       if (event["status"] == "success") {
  //         // Handle transaction details here.
  //         var transactionDetails = event["data"];
  //         print(transactionDetails);
  //         if (transactionDetails["isSuccess"]) {
  //           print("successful transaction");
  //           if (transactionDetails["isPending"]) {
  //             print("transaction pending");
  //           }
  //         } else {
  //           print("failed transaction");
  //         }

  //         // print(transactionDetails["isSuccess"]);
  //       } else if (event["status"] == "error") {
  //         // Handle error here.
  //       } else if (event["status"] == "event") {
  //         // Handle events here.
  //       }
  //     });
  //   });
  // }

  // Future<void> apmsPayPressed() async {
  //   FlutterPaytabsBridge.startAlternativePaymentMethod(generateConfig(),
  //       (event) {
  //     setState(() {
  //       if (event["status"] == "success") {
  //         // Handle transaction details here.
  //         var transactionDetails = event["data"];
  //         print(transactionDetails);
  //       } else if (event["status"] == "error") {
  //         // Handle error here.
  //       } else if (event["status"] == "event") {
  //         // Handle events here.
  //       }
  //     });
  //   });
  // }

  // Future<void> queryPressed() async {
  //   FlutterPaytabsBridge.queryTransaction(
  //       generateConfig(), generateQueryConfig(), (event) {
  //     setState(() {
  //       if (event["status"] == "success") {
  //         // Handle transaction details here.
  //         var transactionDetails = event["data"];
  //         print(transactionDetails);
  //       } else if (event["status"] == "error") {
  //         // Handle error here.
  //       } else if (event["status"] == "event") {
  //         // Handle events here.
  //       }
  //     });
  //   });
  // }

  // Future<void> applePayPressed() async {
  //   var configuration = PaymentSdkConfigurationDetails(
  //       profileId: "*Profile id*",
  //       serverKey: "*server key*",
  //       clientKey: "*client key*",
  //       cartId: "12433",
  //       cartDescription: "Flowers",
  //       merchantName: "Flowers Store",
  //       amount: 20.0,
  //       currencyCode: "AED",
  //       merchantCountryCode: "ae",
  //       merchantApplePayIndentifier: "merchant.com.bunldeId",
  //       simplifyApplePayValidation: true);
  //   FlutterPaytabsBridge.startApplePayPayment(configuration, (event) {
  //     setState(() {
  //       if (event["status"] == "success") {
  //         // Handle transaction details here.
  //         var transactionDetails = event["data"];
  //         print(transactionDetails);
  //       } else if (event["status"] == "error") {
  //         // Handle error here.
  //       } else if (event["status"] == "event") {
  //         // Handle events here.
  //       }
  //     });
  //   });
  // }

  // Widget applePayButton() {
  //   if (Platform.isIOS) {
  //     return TextButton(
  //       onPressed: () {
  //         applePayPressed();
  //       },
  //       child: Text('Pay with Apple Pay'),
  //     );
  //   }
  //   return SizedBox(height: 0);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('payment Screen'),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            // Text('$_instructions'),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                payPressed();
              },
              child: Text('Pay with Card'),
            ),
            // TextButton(
            //   onPressed: () {
            //     Future.delayed(const Duration(seconds: 20)).then(
            //         (value) => FlutterPaytabsBridge.cancelPayment((dynamic) {
            //               debugPrint("cancel payment $dynamic");
            //             }));
            //   },
            //   child: Text('Cancel Payment After 20 sec'),
            // ),
            // TextButton(
            //   onPressed: () {
            //     payWithTokenPressed();
            //   },
            //   child: Text('Pay with Token'),
            // ),
            // TextButton(
            //   onPressed: () {
            //     payWith3ds();
            //   },
            //   child: Text('Pay with 3ds'),
            // ),
            // TextButton(
            //   onPressed: () {
            //     payWithSavedCards();
            //   },
            //   child: Text('Pay with saved cards'),
            // ),
            // SizedBox(height: 16),
            // TextButton(
            //   onPressed: () {
            //     apmsPayPressed();
            //   },
            //   child: Text('Pay with Alternative payment methods'),
            // ),
            // SizedBox(height: 16),
            // TextButton(
            //   onPressed: () {
            //     queryPressed();
            //   },
            //   child: Text('Query transaction'),
            // ),
            // TextButton(
            //   onPressed: () {
            //     _clearSavedCards();
            //   },
            //   child: Text('Clear saved cards'),
            // ),
            // SizedBox(height: 16),
            // applePayButton()
          ])),
    );
  }

  Future _clearSavedCards() async {
    final result = await FlutterPaytabsBridge.clearSavedCards();
    debugPrint("ClearSavedCards $result");
  }

  PaymentSDKQueryConfiguration generateQueryConfig() {
    return new PaymentSDKQueryConfiguration("ServerKey", "ClientKey",
        "Country Iso 2", "Profile Id", "Transaction Reference");
  }
}

/////\
///
///
///
///
///
///
///
///
///
///
///
/// the old payment screen ///

// var billingDetails = new BillingDetails("billing name", "billing email",
//     "billing phone", "address line", "country", "city", "state", "zip code");

// var shippingDetails = new ShippingDetails("shipping name", "shipping email",
//     "shipping phone", "address line", "country", "city", "state", "zip code");

// #### Tokenise types #### //
// enum PaymentSdkTokeniseType {
//   NONE,
//   USER_OPTIONAL,
//   USER_MANDATORY,
//   MERCHANT_MANDATORY,
//   USER_OPTIONAL_DEFAULT_ON
// }

// #### #### //
// #### #### //
// var paymentTheme = IOSThemeConfigurations(logoImage: AppImages.logoPng);
// var configuration = PaymentSdkConfigurationDetails(
//   profileId: "profile id",
//   serverKey: "your server key",
//   clientKey: "your client key",
//   cartId: "cart id",
//   cartDescription: "cart desc",
//   merchantName: "merchant name",
//   screentTitle: "Pay with Card",
//   billingDetails: billingDetails,
//   shippingDetails: shippingDetails,
//   locale: PaymentSdkLocale.EN, //PaymentSdkLocale.AR or PaymentSdkLocale.DEFAULT
//   amount: 50000.00,
//   currencyCode: "Currency code",
//   merchantCountryCode: "2 chars iso country code",

//   //       // optinal
//   //       configuration.showBillingInfo = true;
//   // configuration.showShippingInfo = true;
//   // #### #### //

//   /** To establish a timeout of 2 minutes.
//  * Set to zero to deactivate the timeout feature.
//  * Note that the expiryTime cannot be set to less than 60 seconds.
//  * */
//   expiryTime: 120,
//   iOSThemeConfigurations: paymentTheme,
//   // tokeniseType : PaymentSdkTokeniseType.USER_OPTIONAL;
// );

// #### #### //
// #### #### //

// #### startCardPayment #### //
// FlutterPaytabsBridge.startCardPayment(configuration, (event) {
//       setState(() {
//         if (event["status"] == "success") {
//           // Handle transaction details here.
//           var transactionDetails = event["data"];
//           print(transactionDetails);

//           if (transactionDetails["isSuccess"]) {
//             print("successful transaction");
//           } else {
//             print("failed transaction");
//           }
//         } else if (event["status"] == "error") {
//           // Handle error here.
//         } else if (event["status"] == "event") {
//           // Handle cancel events here.
//         }
//       });
//     });

// #### #### //
// #### #### //

// #### startPaymentWithSavedCards #### //
// FlutterPaytabsBridge.startPaymentWithSavedCards(configuration, support3DsBoolean, (event) {
//       setState(() {
//         if (event["status"] == "success") {
//           // Handle transaction details here.
//           var transactionDetails = event["data"];
//           print(transactionDetails);

//           if (transactionDetails["isSuccess"]) {
//             print("successful transaction");
//           } else {
//             print("failed transaction");
//           }
//         } else if (event["status"] == "error") {
//           // Handle error here.
//         } else if (event["status"] == "event") {
//           // Handle cancel events here.
//         }
//       });
//     });
