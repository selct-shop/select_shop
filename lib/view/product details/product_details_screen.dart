import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/theme/colors.dart';

// Key prodcutImageKey = key();
class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            _ProductPicticher(),
          ],
        ),
      )),
    );
  }
}

class _ProductPicticher extends StatelessWidget {
  const _ProductPicticher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: Stack(
        children: [
          Expanded(
              child: Image.asset(
                  // key:

                  fit: BoxFit.cover,
                  AppImages.mainCarouselSlider)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _SmallTagContainer(),
                  _SmallTagContainer(),
                  _SmallTagContainer(),
                  _SmallTagContainer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallTagContainer extends StatelessWidget {
  const _SmallTagContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 3,
      ),
      width: 20,
      height: 5,
      decoration: BoxDecoration(
          color: AppColors.mainColor,
          border: Border.all(
            color: AppColors.mainColor,
          )),
    );
  }
}
