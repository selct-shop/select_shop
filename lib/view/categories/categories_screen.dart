// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/main.dart';
import 'package:select_shop/models/categories/categories_modle.dart';
import 'package:select_shop/models/categories/get_main_categories_deatails.dart';
import 'package:select_shop/view/Shared/app_no_data.dart';
import 'package:select_shop/view/Shared/error_screen.dart';
import 'package:select_shop/view/Shared/loading_screen.dart';
import 'package:select_shop/view/categories/bloc/categories_bloc.dart';
import 'package:select_shop/view/product%20details/product_details_screen.dart';
import 'package:select_shop/view/product%20of%20category/products_main_of_categorys_screen.dart';

TextStyle _titleTextStyle = TextStyle(
    color: AppColors.mainColor, fontSize: 20, fontWeight: FontWeight.bold);

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  // ignore: must_call_super
  initState() {
    context.read<CategoriesBloc>().add(GetMainCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBloc, CategoriesState>(
      listener: (context, state) {
        // TODO: implement listener
        // if (state is CategoriesInitialState) {
        // context.read<CategoriesBloc>().add(GetCategoriesEvent());
        //
        // }
      },
      builder: (context, state) {
        if (state is CategoriesLoadingState) {
          return CustomLoadingScreen();
        } else if (state is CategoriesErrorState) {
          return ErrorScreen(
            errorMessage: state.errorMessage,
          );
        } else if (state is CategoriesSuccsessState) {
          return _Body();
        } else {
          return Center(
            child: AppNoData(),
          );
        }
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(15),
      itemCount: context.read<CategoriesBloc>().categoriesLisssst!.length,
      // shrinkWrap: true,

      itemBuilder: (context, index) {
        return _CustomCategory(
          categoriesResult:
              context.read<CategoriesBloc>().categoriesLisssst![index]!,
        );
      },
    );
  }
}

class _CustomCategory extends StatelessWidget {
  final MainCategoriesResult categoriesResult;
  const _CustomCategory({
    super.key,
    required this.categoriesResult,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          // navigate to products of category screen
          // pass the category id
          navigateTo(
              context,
              ProductsOfCategoryScreen(
                mainCategoryId: categoriesResult.id!,
              ));
        },
        child: Container(
          // margin: EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 180,
          // alignment: Alignment.centerLeft,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.greyColor.withOpacity(.2),
            image: DecorationImage(
              fit: BoxFit.cover,
              // image: AssetImage(
              //   AppImages.categories,
              // ),
              //   image: CachedNetworkImageProvider(
              //       "${DioHelper.baseUrl}/${categoriesResult.categoryImage}" ,
              // ),
              // image:
              // NetworkImage("${DioHelper.baseUrl}${categoriesResult.image}"),
              image: NetworkImage(
                  categoriesResult.image ?? globalDefaltCachedNetworkImage),
              //  onError:
            ),
            boxShadow: [
              BoxShadow(
                  offset: Offset(2, 4),
                  color: AppColors.mainGreyColor.withOpacity(.1),
                  spreadRadius: 1,
                  blurRadius: 5)
            ],
            // color: AppColors.mainGreyColor,
            borderRadius: BorderRadius.circular(12),
          ),
          // child: Text('data'),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: (
                // category id

                ) {
              // navigate to products of category screen
              // pass the category id
              // navigateTo(context, ProductsOfCategoryScreen(mainCategoryId: categoriesResult.id!, ));
            },
            child: Container(
              height: 100,
              width: 170,
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(

                  // color: AppColors.mainGreyColor.withOpacity(.1),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 160,
                    height: 22,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        // category name ,
                        categoriesResult.nameEn!,
                        style: _titleTextStyle.copyWith(
                          height: .8,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        // textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    height: 22,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      // child: Text(
                      //   "${categoriesResult.children.length} items",
                      //   style: TextStyle(
                      //     color: AppColors.mainGreyColor,
                      //     fontSize: 14,
                      //     height: .8,
                      //   ),
                      //   maxLines: 1,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                    ),
                  ),
                  Container(
                    // width: 90,
                    height: 20,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor.withOpacity(
                        .1,
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "shop now",
                          style: TextStyle(
                              fontSize: 12, color: AppColors.mainColor),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Image.asset(
                          AppImages.cartSmall,
                          height: 15,
                          width: 15,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
