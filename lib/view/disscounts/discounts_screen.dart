// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';

class DiscountsScreen extends StatelessWidget {
  const DiscountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
                width: 30,
              ),
              Text(
                "${S.of(context).theDiscaount} :",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
                width: 30,
              ),
              for (int i = 0; i < 10; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _DiscountWidget(
                    discount: "20 +%",
                    discountDetails: "discount details, and more and more",
                    discountTitle: S.of(context).categorys,
                  ),
                ),
            ],
          ),
        ),
      )),
    );
  }
}

class _DiscountWidget extends StatelessWidget {
  final String? discount, discountTitle, discountDetails;
  const _DiscountWidget({
    super.key,
    required this.discount,
    required this.discountTitle,
    required this.discountDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: EdgeInsets.all(
        15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: AppColors.greyColor.withOpacity(.1),
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                discount ?? "uk",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                S.of(context).theDiscaount,
                style: TextStyle(
                  color: AppColors.mainColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
            height: double.infinity,
            child: Center(
              child: Dash(
                //   // double.infinity is not supported by this packge
                //   length: double.infinity,
                //   // length: MediaQuery.of(context).size.width - 30,
                dashColor: AppColors.grey2Color,
                direction: Axis.vertical,
                length: 50,
              ),
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                discountTitle ?? "uk",
                style: TextStyle(
                  color: AppColors.grey2Color,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                // S.of(context).categorys,
                discountDetails ?? "uk",
                style: TextStyle(
                  color: AppColors.grey2Color,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
