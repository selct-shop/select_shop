// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/view/Shared/app_button.dart';
import 'package:select_shop/view/Shared/product_container.dart';

// Key _titleKey = Key();

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    List<StepperData> stepperData = [
      StepperData(
          title: StepperText(
            S.of(context).orderPlaced,
            textStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
          subtitle: StepperText(S.of(context).orderPlacedMessage),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: const Icon(Icons.confirmation_number_rounded,
                color: Colors.white),
          )),
      StepperData(
          title: StepperText(
            S.of(context).processing,
            textStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
          subtitle: StepperText(S.of(context).processingMessage),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: const Icon(Icons.precision_manufacturing_rounded,
                color: Colors.white),
          )),
      StepperData(
          title: StepperText(
            S.of(context).orderConfirmed,
            textStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
          subtitle: StepperText(S.of(context).orderConfirmedMessage),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: const Icon(Icons.production_quantity_limits_rounded,
                color: Colors.white),
          )),
      StepperData(
          title: StepperText(S.of(context).shipped),
          subtitle: StepperText(S.of(context).shippedMessage),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: const Icon(Icons.check_box_rounded, color: Colors.white),
          )),
      StepperData(
          title: StepperText(S.of(context).onTheWay),
          subtitle: StepperText(S.of(context).onTheWayMessage),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: AppColors.greyColor,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child:
                const Icon(Icons.local_shipping_rounded, color: Colors.white),
          )),
      StepperData(
          title: StepperText(S.of(context).delivered,
              textStyle: const TextStyle(color: Colors.grey)),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: AppColors.greyColor,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: const Icon(Icons.done_rounded, color: Colors.white),
          )),
    ];

    return Scaffold(
      body: SafeArea(
          child: Scaffold(
        body: ListView(
          shrinkWrap: true,
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
              S.of(context).trackOrder,
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
                    onTapProductWidget: () {},
                    onTapAddOrRemoveFav: () {},
                  ),
                  const SizedBox(
                    height: 15,
                    width: 15,
                  ),
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
                    S.of(context).orderStage,
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: .8,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
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
              child: AnotherStepper(
                stepperList: stepperData,
                stepperDirection: Axis.vertical,
                iconWidth: 40,
                iconHeight: 40,
                activeBarColor: AppColors.mainColor,
                inActiveBarColor: AppColors.greyColor,
                inverted: true,
                verticalGap: 30,
                activeIndex: 3,
                barThickness: 3,
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

            AppButton(
              title: "set state",
              backgroundColor: AppColors.mainColor,
              onTap: () {
                setState(() {});
              },
            )
          ],
        ),
      )),
    );
  }
}
