import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/view/Shared/appbar.dart';
import 'package:select_shop/view/Shared/bottom_nav_bar.dart';
import 'package:select_shop/view/Shared/floating_acction_button.dart';

final String _productNmae = "men shirt";
final String _discountOrNewTag = "disscount";
final String _ProductDiscription =
    "product discription, product discription, product discription, product discription, product discription, product discription, ";
final String _ProductOldPrice = "120";
final String _ProductNewPrice = "97";
final String _brandName = "chanel";

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          children: [
            AppConstants.emptySpaceTenPixl,
            AppConstants.emptySpaceTenPixl,
            AppConstants.emptySpaceTenPixl,
            _productContainer(),
            _productContainer(),
            _productContainer(),
            _productContainer(),
            _productContainer(),
            _productContainer(),
            _productContainer(),
            _productContainer(),
            _productContainer(),
            _productContainer(),
            _productContainer(),
            _productContainer(),
            _productContainer(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingAcctionButton(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

class _productContainer extends StatelessWidget {
  const _productContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 134,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.mainGreyColor.withOpacity(.3),
                blurRadius: 5,
                offset: Offset(3, 3),
              ),
              BoxShadow(
                color: AppColors.mainGreyColor.withOpacity(.3),
                blurRadius: 5,
                offset: Offset(-3, -1),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _TagAndFavRow(),
                  _NameAndRatingRow(),
                  _CategoryNameRow(),
                  _DescriptionRow(),
                  _PriceAndPrandRow(),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              )),
              const SizedBox(
                width: 15,
              ),
              Container(
                width: 120,
                height: double.infinity,
                clipBehavior: Clip.hardEdge,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(AppImages.mainCarouselSlider),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryNameRow extends StatelessWidget {
  const _CategoryNameRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          Text(
            "${S.of(context).category}: ",
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            "men",
            style: TextStyle(fontSize: 10, color: AppColors.mainColor),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _DescriptionRow extends StatelessWidget {
  const _DescriptionRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Center(
              child: Text(
                _ProductDiscription,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.grey2Color,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}

class _PriceAndPrandRow extends StatelessWidget {
  const _PriceAndPrandRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          // width: 35,
                          // height: 10,
                          child: Expanded(
                            child: Center(
                              child: Text(
                                // old product price

                                "${_ProductOldPrice} AED",
                                // overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    height: .9,
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.greyColor),
                              ),
                            ),
                          ),
                        ),

                        //
                        //

                        SizedBox(
                          // width: 35,
                          // height: 25,
                          child: Expanded(
                            child: Center(
                              child: Text(
                                // AED

                                "AED",
                                // overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    height: .8,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: AppColors.mainColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      // new product price
                      // width: 35,
                      // height: 25,
                      child: Text(
                        // price

                        _ProductNewPrice,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            height: .8,
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.mainColor),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Spacer(),
          SizedBox(

              // brand image
              height: 15,
              width: 25,
              child: Image.asset(
                fit: BoxFit.cover,
                AppImages.chanelLogoJfif,
              )),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            // brand name
            height: double.infinity,
            width: 55,
            child: Expanded(
              child: Center(
                child: Text(
                  _brandName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppColors.mainColor),
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   width: 10,
          // ),
        ],
      ),
    );
  }
}

class _NameAndRatingRow extends StatelessWidget {
  const _NameAndRatingRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18,
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 18,
            width: 90,
            child: Expanded(
              child: Text(
                // textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  height: .8,
                ),
                _productNmae,
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            width: 90,
            height: 15,
            child: Row(
              children: [
                Spacer(),
                for (int i = 1; i <= 5; i++)
                  Icon(
                      color: AppColors.mainColor,
                      size: 18,
                      Icons.star_rate_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _TagAndFavRow extends StatelessWidget {
  const _TagAndFavRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                // tag for disscount or new
                alignment: Alignment.center,
                width: 60,
                height: 25,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    )),
                child: Text(
                  _discountOrNewTag,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                width: 20,
                height: 20,
                AppImages.favourFilledSvg,
              ),
            ],
          )
        ],
      ),
    );
  }
}
