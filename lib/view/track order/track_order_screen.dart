// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:order_tracker_zen/order_tracker_zen.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/view/Shared/product_container.dart';

// Key _titleKey = Key();
List<StepperData> stepperData = [
  StepperData(
      title: StepperText(
        "Order Placed",
        textStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      subtitle: StepperText("Your order has been placed"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(30))),
      )),
  StepperData(
      title: StepperText("Preparing"),
      subtitle: StepperText("Your order is being prepared"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.looks_two, color: Colors.white),
      )),
  StepperData(
      title: StepperText("On the way"),
      subtitle: StepperText(
          "Our delivery executive is on the way to deliver your item"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.looks_3, color: Colors.white),
      )),
  StepperData(
      title: StepperText(
        "Order Placed",
        textStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      subtitle: StepperText("Your order has been placed"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(30))),
      )),
  StepperData(
      title: StepperText(
        "Order Placed",
        textStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      subtitle: StepperText("Your order has been placed"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(30))),
      )),
  StepperData(
      title: StepperText("Delivered",
          textStyle: const TextStyle(color: Colors.grey)),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.all(Radius.circular(30))),
      )),
];

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Scaffold(
        body: ListView(
          children: [
            ///
            ///
            ///
            ///
            ///
            ///
            const SizedBox(
              height: 30,
              width: 30,
            ),
            Text(
              "Track Order",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 26,
                height: .8,
              ),
            ),

            ///
            ///
            ///
            ///
            ///
            ///
            const SizedBox(
              height: 30,
              width: 30,
            ),

            Container(
              height: 520,
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.grey2Color.withOpacity(.03),
              ),
              child: Column(
                children: [
                  ProductContainer(
                    brandName: "zara",
                    brandNetworkImage: null,
                    isDisscountOrNew: true,
                    isFavourated: true,
                    isDiscountOrNew: true,
                    hasPaddings: false,
                    productName: 't-shirt',
                    categoryName: 'men',
                    productDiscreption:
                        'this is just a test for the product discription, and so on',
                    oldPrice: '499',
                    newPrice: '299',
                    productNetworkImage: null,
                    productRating: 4.5,
                    // width: ,
                    // height: null,
                    onTapProductWidget: () {},
                    onTapAddOrRemoveFav: () {},
                  ),
                  const SizedBox(
                    height: 15,
                    width: 15,
                  ),

                  ////
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  Expanded(
                    child: Container(
                      // height: double.infinity,
                      // width: double.infinity,
                      // the maps container

                      // height: 315,

                      // width: double.infinity,

                      decoration: BoxDecoration(
                        color: AppColors.grey2Color,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  )
                ],
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

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
// key:  ,
                    "order stage : ",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: .8,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Divider(
                  //   color: AppColors.grey2Color.withOpacity(.2),
                  //   endIndent: 15,
                  // ),
                ],
              ),
            ),

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

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: AnotherStepper(
                stepperList: stepperData,
                stepperDirection: Axis.vertical,
                iconWidth: 40,
                iconHeight: 40,
                activeBarColor: AppColors.mainColor,
                inActiveBarColor: AppColors.greyColor,
                inverted: true,
                verticalGap: 30,
                activeIndex: 1,
                barThickness: 3,
              ),
            ),

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
          ],
        ),
      )),
    );
  }
}
