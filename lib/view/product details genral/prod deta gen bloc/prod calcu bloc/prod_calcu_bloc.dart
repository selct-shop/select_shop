import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:http_status/http_status.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';
import 'package:select_shop/view/home/widgets/products%20new/bloc/products_new_bloc.dart';
import 'package:select_shop/view/product%20details%20genral/models/prduct_calculations_model.dart';

part 'prod_calcu_event.dart';
part 'prod_calcu_state.dart';

class ProdCalcuBloc extends Bloc<ProdCalcuEvent, ProdCalcuState> {
  ProdCalcuBloc() : super(ProdCalcuInitialState()) {
    on<ProdCalcuEvent>((event, emit) async{
      // TODO: implement event handler



// #### get the product calculations #### //
      if (event is ProdCalcuInitalEvent){




   emit(ProdCalcuLoadingState());
        // loadingNewProducts = true;
        // get all the categories
        try {
          


final Response response = await DioHelper.getProductsCalculations(productID: event.productID); 

       
       if(response.statusCode != null ){





           if (response.statusCode!.isSuccessfulHttpStatusCode) {
            // print("reeeeeeeeeeeeeeeeeeeeeeeeeeeeeepooo");
            ProductCalculationsModel productCalculationsModel =
                ProductCalculationsModel.fromJson(response.data);
                
          

              emit(ProdCalcuSucsessState(
                productCalculationsModel: productCalculationsModel, 

              ));
          
          } else {
            emit(ProdCalcuErrorState(
                errorMessage:
                    "${response.statusCode} \n ${response.statusMessage}"));
          }
       }
       
   
        } catch (exception) {
          emit(ProdCalcuErrorState(errorMessage: "$exception"));
        }

      }
    });
  }
}
