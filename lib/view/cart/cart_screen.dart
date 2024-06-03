import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/view/Shared/app_button.dart';
import 'package:select_shop/view/Shared/error_screen.dart';
import 'package:select_shop/view/Shared/loading_screen.dart';
import 'package:select_shop/view/Shared/product_container.dart';
import 'package:select_shop/view/Shared/under_develop_screen.dart';
import 'package:select_shop/view/cart/bloc/cart_bloc_bloc.dart';
import 'package:select_shop/view/cart/model/cart_model.dart';
import 'package:select_shop/view/check%20out/check_out_screen.dart';
import 'package:select_shop/view/product%20details%20genral/product_details_genral_screen.dart';
import 'package:select_shop/view/products/products_screen.dart';

part 'widgets/product_card.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CartBloc>().add(CartInitalEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoadingState) return const CustomLoadingScreen();

            if (state is CartEmptyState)
              return const Center(
                child: Text("empty cart"),
              );

            if (state is CartErrorState)
              return ErrorScreen(
                  errorMessage: state.errorMessage ?? "unknown  ");

            if (state is CartSucsessState) {
              // print(
              //     "cccccccccccccccccccccccccccccccccccccccccccsucssssessSSSS");

              return _ListCartSucsess(
                cartResult: state.cartResult!,
              );
            } else {
              return ErrorScreen(errorMessage: "unknown Error");
            }
          },
        ),
      ),
    );
  }
}

class _ListCartSucsess extends StatelessWidget {
  final CartResult cartResult;
  const _ListCartSucsess({
    super.key,
    required this.cartResult,
  });

  @override
  Widget build(BuildContext context) {
    List<CartItem> cartItems = cartResult.cart.cartItems;
    return Column(
      // mainAxisSize: MainAxisSize.max,
      children: [
        ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 30,
          ),
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            // const Column(children: [

            //   AppConstants.emptySpaceTenPixl,
            //   AppConstants.emptySpaceTenPixl,
            //   AppConstants.emptySpaceTenPixl,
            // ],)

            return _ProductCart(
              cartItem: cartItems[index],
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: AppButton(
            title: "check out",
            backgroundColor: AppColors.mainColor,
            borderRadius: 10,
            // textColor:  ,
            width: double.infinity,
            onTap: () => navigateTo(context, CheckOutScreen()),
          ),
        ),
        AppConstants.emptySpaceTenPixl,
        AppConstants.emptySpaceTenPixl,
        AppConstants.emptySpaceTenPixl,
        AppConstants.emptySpaceTenPixl,
        AppConstants.emptySpaceTenPixl,
        AppConstants.emptySpaceTenPixl,
      ],
    );
  }
}
