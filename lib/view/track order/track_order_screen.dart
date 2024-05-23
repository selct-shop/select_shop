// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/view/Shared/product_container.dart';

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
                children: [ProductContainer(
                  brandName: "zara",
                )],
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
          ],
        ),
      )),
    );
  }
}
