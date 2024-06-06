import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:http_status/http_status.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/view/cart/model/cart_model.dart';
import 'package:select_shop/view/categories/bloc/categories_bloc.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    CartResult? cartResult;

    on<CartEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is CartInitalEvent) {
        emit(CartLoadingState());
        // get all user cart data
        try {
          Response getUserCartResponse = await DioHelper.getUserCart();

          if (getUserCartResponse.statusCode != null) {
            if (getUserCartResponse.statusCode!.isSuccessfulHttpStatusCode) {
              print(
                  "cccccccccccccccccccccccccccccccccccccccccccsssssssssseeeeeiiiiiiiiiiiiiiiiiii${getUserCartResponse.statusMessage}===${getUserCartResponse.data}===${getUserCartResponse.statusCode}");
              CartModel getCartModel =
                  CartModel.fromJson(getUserCartResponse.data);
              print(
                  "ccccccccccccccccccccccccccccccccccccccccccc${getCartModel.result.cart.cartItems.length}");
              print(
                  "ccccccccccccccccccccccccccccccccccccccccccc${getCartModel.result}");
              if (getCartModel.result != null) {
                cartResult = getCartModel.result;

                emit(CartSucsessState(cartModel: getCartModel));
              }

              if (getCartModel.result.cart.cartItems == null ||
                  getCartModel.result.cart.cartItems.isEmpty) {
                emit(CartEmptyState());
              }
            } else {
              emit(CartErrorState(
                  errorMessage:
                      "${getUserCartResponse.statusCode} \n ${getUserCartResponse.statusMessage}"));
            }
          } else {}
        } catch (exception) {
          emit(CartErrorState(errorMessage: exception.toString()));
        }
      }
    });
  }
}
