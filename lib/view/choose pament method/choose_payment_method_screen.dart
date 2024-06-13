// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
// import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/view/Shared/under_develop_screen.dart';
import 'package:select_shop/view/check%20out/bloc/check_out_bloc.dart';

Key? cashRadioButtonKey;
Key? cardRadioButtonKey;

List<Map<String, dynamic>> paymentTypes = [
  {'label': 'cash', 'value': 1},
  {'label': 'credit', 'value': 2},
];

// enum  PaymentTypes  {
//   // {'label': 'cash', 'value': 1},
//   // {'label': 'credit', 'value': 2},

// "cash" ,
// }

// Map<String, dynamic> activePaymentType = paymentTypes[0];
// int activePaymentType = 1;
Map<String, dynamic> activePaymentType = paymentTypes[1];

class ChoosePaymentMethodScreen extends StatefulWidget {
  const ChoosePaymentMethodScreen({super.key});

  @override
  State<ChoosePaymentMethodScreen> createState() =>
      _ChoosePaymentMethodScreenState();
}

class _ChoosePaymentMethodScreenState extends State<ChoosePaymentMethodScreen> {
  @override
  void initState() {
    // TODO: implement initState

    // set the payment method to 2
    context
        .read<CheckOutBloc>()
        .add(ChangePaymentMethodEvent(paymentMethod: 222));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              children: [
                ///
                ///
                ///
                ///
                ///
                ///
                const SizedBox(
                  height: 60,
                  width: 60,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    // navigate to add new location
                    // navigateTo(context, CreateNewLocationScreen());
                  },
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 1,
                          spreadRadius: 1,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            // cach svg image
                            const Icon(
                              Icons.add_circle_outline_rounded,
                              size: 24,
                              color: AppColors.mainColor,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "pay on delivery",
                              style: TextStyle(
                                color: AppColors.grey2Color,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                height: .8,

                                // overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Spacer(),

                            // here cash payment
                            Radio<Map<String, dynamic>>(
                                key: cardRadioButtonKey,
                                // value: paymentTypes[0]["value"],
                                value: paymentTypes[0],
                                groupValue: activePaymentType,
                                // activeColor: AppColors.mainColor,

                                fillColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  // active
                                  if (states.contains(MaterialState.selected)) {
                                    return AppColors.mainColor;
                                  }
                                  // inactive
                                  return AppColors.grey2Color;
                                }),
                                // fillColor:
                                //     MaterialStatePropertyAll(AppColors.grey2Color),
                                onChanged: (value) {
                                  // activePaymentType = paymentTypes[value][0];
                                  activePaymentType = value!;
                                  context.read<CheckOutBloc>().paymentMethod =
                                      111;
                                  context.read<CheckOutBloc>().add(
                                      ChangePaymentMethodEvent(
                                          paymentMethod: 111));

                                  // context.read<CheckOutBloc>().add(ChangePaymentMethodEvent(paymentMethod: 111));

                                  // context.read<CheckOutBloc>().add(
                                  //     ChangePaymentMethodEvent(
                                  //         paymentMethod: 222));

                                  // print("$value valllllllllllllllllllllllllll");
                                  // i should use the bloc instade of set state
                                  setState(() {});
                                }),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                          width: 15,
                        ),
                        Expanded(
                            child: SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: SvgPicture.asset(
                            AppImagesSvg.cashSvg,
                            color: AppColors.mainColor,
                            // height: double.infinity,
                            // width: double.infinity,
                            fit: BoxFit.fitHeight,
                          ),
                        )),
                        const SizedBox(
                          height: 15,
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),

                ///
                ///
                ///
                ///
                ///
                ///
                const SizedBox(
                  height: 15,
                  width: 15,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    // navigate to add new location
                    // navigateTo(context, CreateNewLocationScreen());
                    // also i should use the bloc here to set the new vlaue of the radio button
                    // cardRadioButtonKey.
                  },
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 1,
                          spreadRadius: 1,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            // cach svg image
                            const Icon(
                              Icons.add_circle_outline_rounded,
                              size: 24,
                              color: AppColors.mainColor,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "credit card payment",
                              style: TextStyle(
                                color: AppColors.grey2Color,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                height: .8,

                                // overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Spacer(),

                            // here pay by card option
                            Radio<Map<String, dynamic>>(
                                key: cardRadioButtonKey,
                                value: paymentTypes[1],
                                groupValue: activePaymentType,
                                // activeColor: AppColors.mainColor,
                                // fillColor:
                                //     MaterialStatePropertyAll(AppColors.grey2Color),

                                fillColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  // active
                                  if (states.contains(MaterialState.selected)) {
                                    return AppColors.mainColor;
                                  }
                                  // inactive
                                  return AppColors.grey2Color;
                                }),
                                onChanged: (value) {
                                  activePaymentType = value!;

                                  // i should use the bloc instade of set state
                                  // context.read<CheckOutBloc>().paymentMethod =
                                  //     222;
                                  context.read<CheckOutBloc>().paymentMethod =
                                      222;

                                  context.read<CheckOutBloc>().add(
                                      ChangePaymentMethodEvent(
                                          paymentMethod: 222));

                                  // print(
                                  //     "$value valllllllllllllllllllllllllll${context.read<CheckOutBloc>().paymentMethod}");

                                  // print(
                                  //     "val99999999999999999999llllllllllllllllllllllllll");
                                  setState(() {});
                                }),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                          width: 15,
                        ),
                        Expanded(
                            child: SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: SvgPicture.asset(
                            AppImagesSvg.creditCardsSvg,
                            color: AppColors.mainColor,
                            fit: BoxFit.fitHeight,
                          ),
                        )),
                        const SizedBox(
                          height: 15,
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),

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
                ///
                const SizedBox(
                  height: 15,
                  width: 15,
                ),
                InkWell(
                  // gift card option
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    // navigate to add new location
                    navigateTo(context, UnderDevScreen());
                    // also i should use the bloc here to set the new vlaue of the radio button
                    // cardRadioButtonKey.
                  },
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 1,
                          spreadRadius: 1,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        // cach svg image
                        const Icon(
                          Icons.add_circle_outline_rounded,
                          size: 24,
                          color: AppColors.mainColor,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "you have gift card",
                          style: TextStyle(
                            color: AppColors.grey2Color,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            height: .8,

                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),

                        // just for the empty commit
                        const SizedBox(),

                        Text(
                          "apply",
                          style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            height: .8,

                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),

                ///
                ///
                ///
                ///
                const SizedBox(
                  height: 15,
                  width: 15,
                ),

                _CheckOutDetails(
                  theNewPrice: "299",
                  theDiscount: "7",
                  deliveryPrice: "20",
                  totalPrice: "240",
                ),
              ],
            ),
          ),
        ),
      )),
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
