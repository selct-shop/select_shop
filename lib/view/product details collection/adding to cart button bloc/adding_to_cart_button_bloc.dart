import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:http_status/http_status.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';

part 'adding_to_cart_button_event.dart';
part 'adding_to_cart_button_state.dart';

class AddingToCartButtonBloc
    extends Bloc<AddingToCartButtonEvent, AddingToCartButtonState> {
  AddingToCartButtonBloc() : super(AddiiiingToCartButtonInitialState()) {
    on<AddingToCartButtonEvent>((event, emit) async {
      // TODO: implement event handler

      // #### add product event #### //
      if (event is AddToCarrrtEvent) {
        emit(AddiiiingToCartButtonLoadingState());

        try {
          Response response = await DioHelper.postAddToUserCart(
              productAttributeId: event.productAttrubuteId);
          if (response.statusCode != null) {
            if (response.statusCode!.isSuccessfulHttpStatusCode) {
              emit(AddiiiingToCartButtonSuccessState());

              // print(
              //     'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');

              // print('aaaaaaaaddddddeefeffefefefefefefeefefefee');
            } else {
              emit(AddiiiingToCartButtonErrorState(
                  errorMessage:
                      "${response.statusCode}  \n  ${response.statusMessage}"));
            }
          }
          // emit(ProductDetailsSucsessState(theCollectionProduct: theCollectionProduct))
        } catch (e) {
          emit(
              AddiiiingToCartButtonErrorState(errorMessage: "${e.toString()}"));
        }
      }
    });
  }
}
