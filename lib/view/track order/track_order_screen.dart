// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:order_tracker_zen/order_tracker_zen.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/view/Shared/product_container.dart';

// Key _titleKey = Key();

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
            // const SizedBox(
            //   height: 15,
            //   width: 15,
            // ),

            // OrderTrackerZen(
            //   tracker_data: [
            //     TrackerData(
            //       title: "Order Place",
            //       date: "Sat, 8 Apr '22",
            //       tracker_details: [
            //         TrackerDetails(
            //           title: "Your order was placed on Zenzzen",
            //           datetime: "Sat, 8 Apr '22 - 17:17",
            //         ),
            //         TrackerDetails(
            //           title: "Zenzzen Arranged A Callback Request",
            //           datetime: "Sat, 8 Apr '22 - 17:42",
            //         ),
            //       ],
            //     ),
            //     TrackerData(
            //       title: "Order Shipped",
            //       date: "Sat, 8 Apr '22",
            //       tracker_details: [
            //         TrackerDetails(
            //           title: "Your order was shipped with MailDeli",
            //           datetime: "Sat, 8 Apr '22 - 17:50",
            //         ),
            //       ],
            //     ),
            //     TrackerData(
            //       title: "Order Delivered",
            //       date: "Sat,8 Apr '22",

            //       tracker_details: [
            //         TrackerDetails(
            //           title: "You received your order, by MailDeli",
            //           datetime: "Sat, 8 Apr '22 - 17:51",

            //         ),
            //       ],
            //     ),
            //   ],
            // ),
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
