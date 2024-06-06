import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http_status/http_status.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/models/collection/the_collection_modle.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  bool? addToCartLoading = false;
  bool? addedToCartSucssful = false;
  bool? addedToCartError = false;
  String? addToCartErrorMessage = "";

  String productToBuyCount = "0";
  ProductDetailsBloc() : super(ProductDetailsInitialState()) {
    on<ProductDetailsEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is ProductDetailsInitalEvent) {
        // inital product event
      }

      // // #### add product event #### //
      // if (event is ProductDetailsAddToCartEvent) {
      //   // emit(ProductDetailsLoadingState());
      //   addToCartLoading = true;
      //   addedToCartSucssful = false;

      //   try {
      //     Response response = await DioHelper.postAddToUserCart(
      //         productAttributeId: event.productAttrubuteId);
      //     if (response.statusCode != null) {
      //       if (response.statusCode!.isSuccessfulHttpStatusCode) {
      //         addToCartLoading == false;
      //         addedToCartSucssful == true;
      //         addedToCartError = false;
      //         print(
      //             'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');

      //         print('aaaaaaaaddddddeefeffefefefefefefeefefefee');
      //       } else {
      //         addToCartLoading = false;
      //         addedToCartSucssful = false;
      //         addedToCartError = true;
      //         addToCartErrorMessage = response.statusCode.toString();
      //         await Duration(seconds: 1);
      //         addedToCartError = false;
      //         addToCartErrorMessage = "";
      //       }
      //     }
      //     // emit(ProductDetailsSucsessState(theCollectionProduct: theCollectionProduct))
      //   } catch (e) {
      //     emit(ProductDetailsErrorState(
      //         theErrorMessage: "error \n ${e.toString()}"));
      //   }
      // }
    });
  }
}
